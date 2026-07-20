local M = {}

local autocmds = require("dnhfan.plugins.configs.opencode.status_extmark.autocmds")
local hooks = require("dnhfan.plugins.configs.opencode.status_extmark.hooks")

--- Setup: define highlights, hook prompt API, listen to events.
function M.setup()
  -- Define highlight groups
  vim.api.nvim_set_hl(0, "OpencodeStatusPending", { link = "Comment", default = true })
  vim.api.nvim_set_hl(0, "OpencodeStatusTool", { link = "DiagnosticWarn", default = true })
  vim.api.nvim_set_hl(0, "OpencodeStatusError", { link = "DiagnosticError", default = true })
  vim.api.nvim_set_hl(0, "OpencodeStatusDone", { link = "DiagnosticOk", default = true })

  hooks.setup()
  autocmds.setup()
end

return M
