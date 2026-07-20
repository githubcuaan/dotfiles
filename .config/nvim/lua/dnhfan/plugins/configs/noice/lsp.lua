return {
  hover = {
    enabled = false,
  },

  progress = {
    enabled = false
  },

  documentation = require("dnhfan.plugins.configs.noice.lsp.documentation"),

  signature = require("dnhfan.plugins.configs.noice.lsp.signature"),

  message = {
    enabled = true,
    view = "notify",
    opts = {},
  },

  override = {
    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    ["vim.lsp.util.stylize_markdown"] = true,
  },
}
