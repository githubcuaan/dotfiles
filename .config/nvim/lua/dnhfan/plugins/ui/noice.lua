-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  ---@module "noice"
  ---@type NoiceConfig
  opts = {
    views = require("dnhfan.plugins.configs.noice.view"),

    cmdline = require("dnhfan.plugins.configs.noice.cmdline"),

    lsp = require("dnhfan.plugins.configs.noice.lsp"),

    presets = require("dnhfan.plugins.configs.noice.presets"),

    routes = {
      require("dnhfan.plugins.configs.noice.routes"),
    },

    health = {
      checker = true,
    },

    throttle = 1000 / 30,
    debug = false,
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
