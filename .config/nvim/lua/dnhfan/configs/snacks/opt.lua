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
    enabled = false,
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  words = { enabled = true },
  notifier = { enabled = true },
  image = { enabled = false },
  dashboard = {
    formats = {
      key = function(item)
        return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
      end,
    },
    sections = {
      { section = "terminal",     cmd = { "bash", "-c", "fortune -s | cowsay" }, hl = "header", padding = 1, indent = 8 },
      -- { title = "MRU",            padding = 1 },
      -- { section = "recent_files", limit = 5,                                     padding = 1 },
      { title = "MRU ",           file = vim.fn.fnamemodify(".", ":~"),          padding = 1 },
      { section = "recent_files", cwd = true,                                    limit = 5,     padding = 1 },
      { title = "Sessions",       padding = 1 },
      { section = "projects",     padding = 1 },
      { title = "Bookmarks",      padding = 1 },
      { section = "keys" },
    },
  }
}
