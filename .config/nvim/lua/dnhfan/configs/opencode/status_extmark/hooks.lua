local state = require("dnhfan.configs.opencode.status_extmark.state")

local M = {}

function M.setup()
  local ok, opencode = pcall(require, "opencode")
  if not ok or not opencode.ask or opencode._ask_hooked then
    return
  end

  local original_ask = opencode.ask
  opencode._ask_hooked = true

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
      first_line = math.min(from[1], to[1])
      last_line = math.max(from[1], to[1])
    else
      -- Normal mode: use cursor line
      first_line = vim.api.nvim_win_get_cursor(0)[1]
      last_line = first_line
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
