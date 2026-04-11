return {
  bigfile = { enabled = true },
  indent = require("dnhfan.configs.snacks.indent"),
  input = {
    icon = " ",
    icon_hl = "SnacksInputIcon",
    icon_pos = "left",
    prompt_pos = "title",
    win = { style = "input" },
    expand = true,
  },

  statuscolumn = { enabled = true },

  picker = {
    enabled = true,
    -- Bật hidden ở đây là áp dụng cho tất cả luôn (khỏi cần set lẻ tẻ)
    -- hidden = true,
    sources = {
      files = {
      },
      grep = {
        hidden = true,
      },
    },
  },
  explorer = {
    enabled = true,
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  words = { enabled = false },
  notifier = { enabled = true },
  image = { enabled = false },
  dashboard = {
    enabled = true
  }
}
