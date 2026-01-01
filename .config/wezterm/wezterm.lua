-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- Window conf
config.enable_tab_bar = false
config.window_decorations = "NONE"
-- config.window_background_opacity = 0.9

config.window_padding = {
	left = 3,
	right = 0,
	top = 7,
	bottom = 0,
}

-- Tắt cảnh báo thiếu glyph (Fix cái lỗi 10eeee khó chịu)
config.warn_about_missing_glyphs = false

-- Font + color_scheme
config.font_size = 14
config.font = wezterm.font("FiraMono Nerd Font")
config.color_scheme = "nordfox"

config.enable_wayland = false -- Ubuntu 22.04 hay lỗi vặt với Wayland, về X11 cho lành

-- Finally, return the configuration to wezterm:
return config
