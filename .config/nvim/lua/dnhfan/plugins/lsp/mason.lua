return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = require("dnhfan.core.utils").lsp_servers,
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            border = require("dnhfan.core.utils").border,
            icons = {
              package_pending = " ",
              package_installed = " ",
              package_uninstalled = " ",
            },
          },
        },
      },
      {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
          -- NOTE: Styling
          require("lspconfig.ui.windows").default_options.border = require("dnhfan.core.utils").border

          -- NOTE: Disabled LSP generate logging file
          vim.lsp.set_log_level("off")

          -- NOTE: Diagnostic Sign
          vim.diagnostic.config({
            virtual_text = {
              prefix = " ",
              -- prefix = " ",
              source = "always",
            },
            -- virtual_text = false,
            -- virtual_lines = {},
            signs = {
              text = {
                [vim.diagnostic.severity.ERROR] = require("dnhfan.core.utils").sign_icons.error,
                [vim.diagnostic.severity.WARN] = require("dnhfan.core.utils").sign_icons.warning,
                [vim.diagnostic.severity.HINT] = require("dnhfan.core.utils").sign_icons.hint,
                [vim.diagnostic.severity.INFO] = require("dnhfan.core.utils").sign_icons.info,
              },
              texthl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
              },
              linehl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticVirtualTextError",
                [vim.diagnostic.severity.WARN] = "DiagnosticVirtualTextWarn",
                [vim.diagnostic.severity.HINT] = "DiagnosticVirtualTextHint",
                [vim.diagnostic.severity.INFO] = "DiagnosticVirtualTextInfo",
              },
              numhl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
              },
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = { border = require("dnhfan.core.utils").border, source = true },
          })

          -- 1. Làm trong suốt nền của cái bảng Diagnostic (và cả Hover doc luôn)
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

          -- 2. Làm trong suốt nền của cái viền (Border) cho nó đồng bộ
          -- Nếu không set cái này thì cái viền nó vẫn có màu nền, nhìn dị lắm
          vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        end,
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = require("dnhfan.core.utils").lsp_formatters,
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
