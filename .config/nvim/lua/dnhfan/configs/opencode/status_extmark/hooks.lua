local state = require("dnhfan.configs.opencode.status_extmark.state")

local M = {}

-- Captured range to inject into Context.new when called asynchronously.
-- Cleared after Context.new consumes it.
local _pending_range = nil

function M.setup()
  local ok, opencode = pcall(require, "opencode")
  if not ok or not opencode.ask or opencode._ask_hooked then
    return
  end

  local original_ask = opencode.ask
  opencode._ask_hooked = true

  -- Monkey-patch Context.new to inject the captured range.
  -- The hook captures the range before original_ask() runs, but Context.new()
  -- is called asynchronously after server discovery. By then visual mode is
  -- exited and selection() returns nil. This patch injects our captured range.
  local Context = require("opencode.context")
  local original_context_new = Context.new
  Context.new = function(server, range)
    local result = original_context_new(server, range or _pending_range)
    _pending_range = nil
    return result
  end

  opencode.ask = function(default)
    local bufnr = vim.api.nvim_get_current_buf()

    -- Capture visual range BEFORE original_ask() runs.
    -- original_ask() -> Context.new() -> selection() feeds <esc> to exit visual mode,
    -- so we must capture marks while still in visual mode.
    local first_line, last_line
    local mode = vim.fn.mode()
    if mode:match("[vV\22]") then
      -- In visual mode: exit to update < > marks, then read them
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", true)
      local from = vim.api.nvim_buf_get_mark(bufnr, "<")
      local to = vim.api.nvim_buf_get_mark(bufnr, ">")
      -- Normalize order (same as selection())
      if from[1] > to[1] or (from[1] == to[1] and from[2] > to[2]) then
        from, to = to, from
      end
      first_line = from[1]
      last_line = to[1]
      _pending_range = {
        from = from,
        to = to,
        kind = mode == "V" and "line" or mode == "\22" and "block" or "char",
      }
    else
      -- Normal mode: use cursor line
      first_line = vim.api.nvim_win_get_cursor(0)[1]
      last_line = first_line
      _pending_range = nil
    end

    local result = original_ask(default)

    -- If the prompt contains @this, just capture the location.
    -- Extmarks are placed by autocmds when session.status becomes "busy".
    if default and default:find("@this") then
      vim.schedule(function()
        state.data.bufnr = bufnr
        state.data.first_line = first_line
        state.data.last_line = last_line
        state.data.tool = nil
      end)
    end

    return result
  end
end

return M
