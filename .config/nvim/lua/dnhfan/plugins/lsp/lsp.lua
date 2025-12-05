return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local utils = require("dnhfan.core.utils")

    -- 1. Lấy Capabilities từ Blink
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- 2. SETUP MASON-LSPCONFIG
    require("mason-lspconfig").setup({
      -- Mang list server sang đây
      ensure_installed = utils.lsp_servers,

      -- Thay vì gọi hàm setup_handlers riêng, ta nhét nó vào đây luôn
      handlers = {
        -- ====================================================
        -- 1. Default Handler (Dành cho các server bình thường)
        -- ====================================================
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            -- on_attach = ...
          })
        end,

        -- ====================================================
        -- 2. Custom Handler (Dành cho các server đặc biệt)
        -- ====================================================

        -- Custom handler for emmet_ls
        ["emmet_ls"] = function()
          lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            filetypes = {
              "html",
              "typescriptreact",
              "javascriptreact",
              "css",
              "sass",
              "scss",
              "less",
              "svelte",
              "php",
              "blade",
              "vue",
            },
          })
        end,

        -- Custom handler for eslint
        ["eslint"] = function()
          lspconfig.eslint.setup({
            capabilities = capabilities,
            settings = {
              format = { enable = true },
            },
          })
        end,

        -- Custom handler for basedpyright
        ["basedpyright"] = function()
          lspconfig.basedpyright.setup({
            capabilities = capabilities,

            -- 1. Tắt UI (Hover & Signature)
            -- on_attach = function(client, bufnr)
            --   client.server_capabilities.hoverProvider = false
            --   client.server_capabilities.signatureHelpProvider = false
            -- end,

            -- 2. [PHẦN QUAN TRỌNG] Đừng xóa cái này, xóa là nó bớt khôn đấy
            settings = {
              basedpyright = {
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = true,
                  typeCheckingMode = "standard", -- Hoặc 'basic' tùy bác
                },
              },
            },
          })
        end,
      },
    })
  end,
}
