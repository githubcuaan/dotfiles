require("dnhfan.core").setup({
  transparent_background = true,
  mapleader = " ",
  border_color = "#e7c173",
  doc_border_type = "single",
  win_separator = true,
  background_theme = "dark",
  thick_win_separator = true, -- đổi thành false để giảm tải rendering
  syn_sidebar_with_normal = true,
  float_window_brightness = 40,
  better_cmp_cursor_line = true,
  line_space = 0,
  -- colorscheme = "catppuccin.mocha",
  colorscheme = "nord",
})
require("dnhfan.lsp")
require("dnhfan.lazy")
