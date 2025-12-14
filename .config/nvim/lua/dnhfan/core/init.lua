require("dnhfan.core.options")
require("dnhfan.core.keymaps")

local M = {}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.b.win_separator = true
vim.b.border_color = "#ffffff"
vim.b.transparent_background = false
vim.b.thick_win_separator = false
vim.b.float_window_brightness = 0
-- "bold": Bold line box.
-- "double": Double-line box.
-- "none": No border.
-- "rounded": Like "single", but with rounded corners ("╭" etc.).
-- "shadow": Drop shadow effect, by blending with the background.
-- "single": Single-line box.
-- "solid": Adds padding by a single whitespace cell.
vim.b.doc_border_type = "" ---@type "" | "single" | "double" | "rounded" | "solid" | "shadow" | "none"
vim.opt.background = "dark"
vim.b.better_cmp_cursor_line = false
vim.b.colorscheme = ""
vim.b.syn_sidebar_with_normal = false
vim.b.line_space = 0
vim.o.foldlevel = 99 --Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

M.setup = function(params)
  if params.win_separator ~= nil then
    vim.b.win_separator = params.win_separator
  end

  if params.border_color ~= nil then
    vim.b.border_color = params.border_color
  end

  if params.transparent_background ~= nil then
    vim.b.transparent_background = params.transparent_background
  end

  if params.mapleader ~= nil then
    vim.g.mapleader = params.mapleader
  end

  if params.float_window_brightness ~= nil then
    vim.b.float_window_brightness = params.float_window_brightness
  end

  if params.doc_border_type ~= nil then
    vim.b.doc_border_type = params.doc_border_type
  end

  if params.better_cmp_cursor_line ~= nil then
    vim.b.better_cmp_cursor_line = params.better_cmp_cursor_line
  end

  if params.background_theme ~= nil then
    vim.opt.background = params.background_theme
  end

  if params.colorscheme ~= nil then
    vim.b.colorscheme = params.colorscheme
  end

  if params.thick_win_separator ~= nil then
    vim.b.thick_win_separator = params.thick_win_separator
  end

  if params.syn_sidebar_with_normal ~= nil then
    vim.b.syn_sidebar_with_normal = params.syn_sidebar_with_normal
  end

  if params.line_space ~= nil then
    vim.b.line_space = params.line_space
  end
end
return M
