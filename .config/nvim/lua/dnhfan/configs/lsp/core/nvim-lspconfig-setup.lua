local utils = require("dnhfan.core.utils")
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- 1. Thiết lập Mason để đảm bảo các server được tải về máy
require("mason-lspconfig").setup({
  ensure_installed = utils.lsp_servers,
})

-- 2. Định nghĩa cấu hình cho các server đặc thù
vim.lsp.config("emmet_ls", {
  capabilities = capabilities,
  filetypes = {
    "html", "typescriptreact", "javascriptreact", "css",
    "sass", "scss", "less", "svelte", "php", "blade", "vue",
  },
})

vim.lsp.config("eslint", {
  capabilities = capabilities,
  settings = {
    format = { enable = true },
  },
})

-- 3. Khai báo capabilities chung và kích hoạt toàn bộ server
for _, server in ipairs(utils.lsp_servers) do
  -- Bỏ qua ghi đè cấu hình nếu server đã được định nghĩa cụ thể ở trên
  if server ~= "emmet_ls" and server ~= "eslint" then
    vim.lsp.config(server, {
      capabilities = capabilities,
    })
  end

  -- Kích hoạt server bằng API mới
  vim.lsp.enable(server)
end
