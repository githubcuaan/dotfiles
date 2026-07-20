return {
  -- masoon.nvim: Quản lý LSP, DAP, Linters, Formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ui = require("dnhfan.plugins.configs.lsp.ui.mason-ui"),
    },
  },

  -- mason-lspconfig.nvim: Tích hợp Mason với nvim-lspconfig để tự động cài đặt LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = require("dnhfan.core.utils").lsp_servers,
    },
  },

  -- mason-tool-installer.nvim: Tự động cài đặt các công cụ như linters và formatters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = require("dnhfan.core.utils").lsp_formatters,
    },
  },

  -- nvim-lspconfig: Cấu hình LSP servers, thiết lập diagnostic và giao diện LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Thay "VeryLazy" bằng sự kiện thực tế khi mở file
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    config = function()
      require("dnhfan.plugins.configs.lsp.ui.nvim_lspconfig-ui")
    end,
  },
}
