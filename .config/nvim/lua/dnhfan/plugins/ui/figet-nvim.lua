-- Fidget: A minimalist LSP progress UI for Neovim
return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  config = function()
    require("fidget").setup({
      progress = require("dnhfan.configs.figet.progess"),

      -- Options related to notification subsystem
      notification = require("dnhfan.configs.figet.nofication"),

      -- Options related to logging
      logger = require("dnhfan.configs.figet.logger"),
    })
  end,
}
