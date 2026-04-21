-- Blink: an auto completion for nvim

return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = require("dnhfan.configs.blink.dependencies.dependencies"),
    version = "*",
    opts = {
      enabled = function()
        local filetypes = {
          "toggleterm",
          "NvimTree",
          "Telescope",
          "TelescopePrompt",
          "Avante",
          "AvanteInput",
          "AvantePromptInput",
        }

        return not vim.tbl_contains(filetypes, vim.bo.filetype)
      end,
      keymap = require("dnhfan.configs.blink.keymap").cmp,
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = require("dnhfan.configs.blink.completion"),

      signature = require("dnhfan.configs.blink.signature"),

      snippets = require("dnhfan.configs.blink.snippets"),

      cmdline = require("dnhfan.configs.blink.cmdline"),

      sources = require("dnhfan.configs.blink.sources"),

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
