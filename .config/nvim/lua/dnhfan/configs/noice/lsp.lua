return {
  hover = {
    enabled = false,
  },

  documentation = require("dnhfan.configs.noice.lsp.documentation"),

  signature = require("dnhfan.configs.noice.lsp.signature"),

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
