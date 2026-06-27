require("dnhfan.core").setup({
  transparent_background = true,
  win_separator = true,
  -- background_theme = "dark", -- set dynamically by dnhfan.core.dark-mode
  thick_win_separator = true, -- đổi thành false để giảm tải rendering
  syn_sidebar_with_normal = true,
  float_window_brightness = 40,
  line_space = 0,
  colorscheme = "everforest",
})

require("dnhfan.core.dark-mode").setup()
require("dnhfan.lazy")
