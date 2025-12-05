-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- Window conf
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.9

-- Font + color_scheme
config.font_size = 14
config.font = wezterm.font("FiraMono Nerd Font")
config.color_scheme = "nordfox"

-- Finally, return the configuration to wezterm:
return config
