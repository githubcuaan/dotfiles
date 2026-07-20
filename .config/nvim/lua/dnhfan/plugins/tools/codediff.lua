return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  opts = {
    -- màu sắc diff (thêm/xóa/conflict)
    highlights = require("dnhfan.plugins.configs.codediff.highlights"),

    -- layout diff (side-by-side, inline, ...)
    diff = require("dnhfan.plugins.configs.codediff.diff"),

    -- panel file tree trái
    explorer = require("dnhfan.plugins.configs.codediff.explorer"),

    -- panel lịch sử commit
    history = require("dnhfan.plugins.configs.codediff.history"),

    -- commit
    keymaps = require("dnhfan.plugins.configs.codediff.keymap"),
  },
}
