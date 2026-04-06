return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = require("dnhfan.configs.snacks.opt"),

  keys = require("dnhfan.configs.snacks.key"),

  init = require("dnhfan.configs.snacks.init"),
}
