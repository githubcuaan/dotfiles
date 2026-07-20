-- Fidget: A minimalist LSP progress UI for Neovim
return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  config = function()
    require("fidget").setup({
      progress = require("dnhfan.plugins.configs.figet.progess"),

      -- Options related to notification subsystem
      notification = require("dnhfan.plugins.configs.figet.nofication"),

      -- Options related to logging
      logger = require("dnhfan.plugins.configs.figet.logger"),
    })
  end,
}
