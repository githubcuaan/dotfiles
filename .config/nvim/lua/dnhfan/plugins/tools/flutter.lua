return {
  "nvim-flutter/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = require("dnhfan.plugins.configs.flutter.opt"),
  keys = require("dnhfan.plugins.configs.flutter.key"),
}
