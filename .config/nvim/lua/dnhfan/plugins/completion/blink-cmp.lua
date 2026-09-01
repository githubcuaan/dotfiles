-- Blink: an auto completion for nvim

return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = require("dnhfan.plugins.configs.blink.dependencies.dependencies"),
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
      keymap = require("dnhfan.plugins.configs.blink.keymap").cmp,
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = require("dnhfan.plugins.configs.blink.completion"),

      signature = require("dnhfan.plugins.configs.blink.signature"),

      snippets = require("dnhfan.plugins.configs.blink.snippets"),

      cmdline = require("dnhfan.plugins.configs.blink.cmdline"),

      sources = require("dnhfan.plugins.configs.blink.sources"),

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  {
    -- add blink.compat
    {
      'saghen/blink.compat',
      -- use v2.* for blink.cmp v1.*
      version = '2.*',
      -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
      lazy = true,
      -- make sure to set opts so that lazy.nvim calls blink.compat's setup
      opts = {},
    },

    {
      'saghen/blink.cmp',
      version = '1.*',
    },
  }
}
