return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  opts = {} },
  },
  init = function()
    -- Register LspInfo command eagerly so it's available immediately
    require("dnhfan.configs.lsp.core.nvim-lspconfig-command")
  end,
  config = function()
    require("dnhfan.configs.lsp.core.nvim-lspconfig-setup")
  end,
}
