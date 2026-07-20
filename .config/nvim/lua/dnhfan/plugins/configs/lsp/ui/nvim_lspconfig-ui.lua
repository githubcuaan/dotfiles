-- NOTE: Styling (Cửa sổ LspInfo)
require("lspconfig.ui.windows").default_options.border = require("dnhfan.core.utils").border

-- NOTE: Disabled LSP generate logging file
vim.lsp.log.set_level("off")

-- NOTE: Diagnostic Sign & Virtual Text
vim.diagnostic.config({
  virtual_text = {
    prefix = " ",
    source = true,
  },
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

-- Background trong suốt
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
