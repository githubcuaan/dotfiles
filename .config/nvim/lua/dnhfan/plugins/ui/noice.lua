-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  ---@module "noice"
  ---@type NoiceConfig
  opts = {
    views = require("dnhfan.configs.noice.view"),

    cmdline = require("dnhfan.configs.noice.cmdline"),

    lsp = require("dnhfan.configs.noice.lsp"),

    presets = require("dnhfan.configs.noice.presets"),

    routes = {
      require("dnhfan.configs.noice.routes"),
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
