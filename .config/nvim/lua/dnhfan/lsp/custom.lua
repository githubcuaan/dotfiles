local utils = require("dnhfan.core.utils")

--  Định nghĩa cấu hình riêng (Overrides) cho từng server đặc thù
local custom_configs = {
  eslint = require("dnhfan.lsp.eslint"),
  vtsls = require("dnhfan.lsp.vtsls"),
}

-- Duyệt danh sách, gộp config
for _, server in ipairs(utils.lsp_servers) do
  local config = custom_configs[server] or {}
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
