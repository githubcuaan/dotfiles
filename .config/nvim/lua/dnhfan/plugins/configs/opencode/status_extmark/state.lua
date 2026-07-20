local M = {}

M.NS = vim.api.nvim_create_namespace("opencode_status")

---@class OCStatusState
---@field bufnr? integer
---@field first_line? integer
---@field last_line? integer
---@field tool? string
---@field session_status "idle"|"busy"|"error"|nil
---@field extmarks { above: integer?, below: integer? }
M.data = { extmarks = {} }

M.TOOL_LABELS = {
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

return M
