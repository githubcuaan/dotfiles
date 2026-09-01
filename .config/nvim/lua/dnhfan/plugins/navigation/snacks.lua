return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = require("dnhfan.plugins.configs.snacks.opt"),

  keys = require("dnhfan.plugins.configs.snacks.key"),

  init = require("dnhfan.plugins.configs.snacks.init"),
}
