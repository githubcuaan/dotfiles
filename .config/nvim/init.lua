local defaults = {
  transparent_background = true,
  win_separator = true,
  thick_win_separator = true, -- đổi thành false để giảm tải rendering
  syn_sidebar_with_normal = true,
  float_window_brightness = 40,
  line_space = 0,
  colorscheme = "catppuccin",
}

local ok, local_config = pcall(require, "dnhfan.local")
if ok and local_config then
  for k, v in pairs(local_config) do
    defaults[k] = v
  end
end

require("dnhfan.core").setup(defaults)

require("dnhfan.lazy")
