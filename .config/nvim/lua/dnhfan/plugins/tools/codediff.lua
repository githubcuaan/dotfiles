return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  opts = {
    -- màu sắc diff (thêm/xóa/conflict)
    highlights = require("dnhfan.configs.codediff.highlights"),

    -- layout diff (side-by-side, inline, ...)
    diff = require("dnhfan.configs.codediff.diff"),

    -- panel file tree trái
    explorer = require("dnhfan.configs.codediff.explorer"),

    -- panel lịch sử commit
    history = require("dnhfan.configs.codediff.history"),

    -- commit
    keymaps = require("dnhfan.configs.codediff.keymap"),
  },
}
