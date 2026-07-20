local utils = require("dnhfan.core.utils")

-- Ensure installed via Mason
require("mason-lspconfig").setup({
  ensure_installed = utils.lsp_servers,
})
