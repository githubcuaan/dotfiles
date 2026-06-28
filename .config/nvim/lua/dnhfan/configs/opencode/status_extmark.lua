local M = {}

local NS = vim.api.nvim_create_namespace("opencode_status")

---@class OCStatusState
---@field bufnr? integer
---@field first_line? integer
---@field last_line? integer
---@field tool? string
---@field session_status "idle"|"busy"|"error"|nil
---@field extmarks { above: integer?, below: integer? }
local state = { extmarks = {} }

local TOOL_LABELS = {
  Read = "reading",
  Write = "writing",
  Edit = "editing",
  Patch = "patching",
  Bash = "running shell",
  Glob = "searching files",
  Grep = "searching content",
  Task = "researching",
  WebFetch = "fetching web",
}

--- Clear all extmarks for the current tracked range.
local function clear_extmarks()
  if state.bufnr and vim.api.nvim_buf_is_valid(state.bufnr) then
    if state.extmarks.above then
      pcall(vim.api.nvim_buf_del_extmark, state.bufnr, NS, state.extmarks.above)
    end
    if state.extmarks.below then
      pcall(vim.api.nvim_buf_del_extmark, state.bufnr, NS, state.extmarks.below)
    end
  end
  state.extmarks = {}
end

--- Place extmarks around the tracked code range.
---@param above_text? string
---@param below_text? string
---@param above_hl? string
---@param below_hl? string
local function place_extmarks(above_text, below_text, above_hl, below_hl)
  if not state.bufnr or not state.first_line or not state.last_line then
    return
  end
  if not vim.api.nvim_buf_is_valid(state.bufnr) then
    return
  end

  clear_extmarks()

  -- Above: virt_lines (2 virtual lines above first_line)
  if above_text and above_hl then
    state.extmarks.above = vim.api.nvim_buf_set_extmark(state.bufnr, NS, state.first_line - 1, 0, {
      virt_lines = {
        { { "  " .. above_text, above_hl } },
        { { "", "Normal" } },
      },
      virt_lines_above = true,
    })
  end

  -- Below: virt_text at end of last_line
  if below_text and below_hl then
    local line_len = #vim.api.nvim_buf_get_lines(state.bufnr, state.last_line - 1, state.last_line, false)[1]
    state.extmarks.below = vim.api.nvim_buf_set_extmark(state.bufnr, NS, state.last_line - 1, line_len, {
      virt_text = { { "  " .. below_text, below_hl } },
      virt_text_pos = "eol",
    })
  end
end

--- Update display based on current state.
local function update_display()
  if not state.bufnr then
    return
  end

  if state.session_status == "idle" or state.session_status == nil then
    clear_extmarks()
    return
  end

  if state.session_status == "error" then
    place_extmarks("opencode: error", nil, "OpencodeStatusError", nil)
    return
  end

  -- busy
  local tool_label = state.tool and TOOL_LABELS[state.tool]
  local above = tool_label and ("opencode: " .. tool_label) or "opencode: thinking..."
  local below = "session busy"

  place_extmarks(above, below, "OpencodeStatusTool", "OpencodeStatusPending")
end

--- Capture the current prompt location and set initial extmarks.
---@param bufnr integer
---@param line integer
function M.capture_prompt(bufnr, line)
  clear_extmarks()

  state.bufnr = bufnr
  state.first_line = line
  state.last_line = line
  state.tool = nil

  -- Show initial "thinking" state
  place_extmarks("opencode: thinking...", "session busy", "OpencodeStatusPending", "OpencodeStatusPending")
end

--- Setup: hook prompt API + listen to events.
function M.setup()
  -- Define highlight groups
  vim.api.nvim_set_hl(0, "OpencodeStatusPending", { link = "Comment", default = true })
  vim.api.nvim_set_hl(0, "OpencodeStatusTool", { link = "DiagnosticWarn", default = true })
  vim.api.nvim_set_hl(0, "OpencodeStatusError", { link = "DiagnosticError", default = true })
  vim.api.nvim_set_hl(0, "OpencodeStatusDone", { link = "DiagnosticOk", default = true })

  -- Hook the public opencode.ask API to capture cursor position.
  -- This is safe because it's called from our keymaps, so the module is guaranteed loaded.
  local ok, opencode = pcall(require, "opencode")
  if ok and opencode.ask and not opencode._ask_hooked then
    local original_ask = opencode.ask
    opencode._ask_hooked = true
    opencode.ask = function(default)
      local bufnr = vim.api.nvim_get_current_buf()
      local line = vim.api.nvim_win_get_cursor(0)[1]
      local result = original_ask(default)

      -- If the prompt contains @this, track it for extmarks
      if default and default:find("@this") then
        vim.schedule(function()
          M.capture_prompt(bufnr, line)
        end)
      end

      return result
    end
  end

  -- Listen to session status events
  vim.api.nvim_create_autocmd("User", {
    pattern = {
      "OpencodeEvent:session.status",
      "OpencodeEvent:server.connected",
    },
    callback = function(args)
      local event = args.data.event
      vim.schedule(function()
        if event.type == "server.connected" then
          state.session_status = "idle"
        elseif event.type == "session.status" and event.properties then
          state.session_status = event.properties.status.type
        end
        update_display()
      end)
    end,
    desc = "OpenCode status extmark: session status",
  })

  -- Listen to message.part.updated for tool info
  vim.api.nvim_create_autocmd("User", {
    pattern = "OpencodeEvent:message.part.updated",
    callback = function(args)
      local event = args.data.event
      local part = event.properties and event.properties.part
      if part and part.type == "tool" and part.state then
        vim.schedule(function()
          if part.state.status == "running" or part.state.status == "pending" then
            state.tool = part.tool
            update_display()
          elseif part.state.status == "completed" or part.state.status == "error" then
            -- Keep the tool label visible until session goes idle
            state.tool = part.tool
            update_display()
          end
        end)
      end
    end,
    desc = "OpenCode status extmark: tool events",
  })

  -- Clean up on server dispose
  vim.api.nvim_create_autocmd("User", {
    pattern = "OpencodeEvent:server.instance.disposed",
    callback = function()
      vim.schedule(function()
        clear_extmarks()
        state.tool = nil
        state.session_status = nil
      end)
    end,
    desc = "OpenCode status extmark: server dispose",
  })

  -- Clean up when buffer is deleted
  vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(args)
      if args.buf == state.bufnr then
        clear_extmarks()
        state.bufnr = nil
        state.tool = nil
      end
    end,
    desc = "OpenCode status extmark: buffer cleanup",
  })
end

return M
