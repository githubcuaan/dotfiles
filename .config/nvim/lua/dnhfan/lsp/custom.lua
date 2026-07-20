local utils = require("dnhfan.core.utils")
local capabilities = require("blink.cmp").get_lsp_capabilities()

--  Định nghĩa cấu hình riêng (Overrides) cho từng server đặc thù
local custom_configs = {
  eslint = require("dnhfan.lsp.eslint"),
  vtsls = require("dnhfan.lsp.vtsls"),
}

-- Duyệt danh sách, gộp config
for _, server in ipairs(utils.lsp_servers) do
  -- Merge capabilities mặc định với config riêng (nếu có)
  local config = vim.tbl_deep_extend(
    "force",
    { capabilities = capabilities },
    custom_configs[server] or {}
  )
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
