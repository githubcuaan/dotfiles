return vim.b.colorscheme ~= "nordic" and {} or {
  'AlexvZyl/nordic.nvim',
  priority = 100,
  config = function()
    require 'nordic' .setup {
      on_palette = function(palette)
        return palette
      end,
      bold_keywords = true,
      italic_comments = true,
      transparent = {
        bg = false,
        float =  false
      },
      bright_border = false,
      reduced_blue = false,
      swap_backgrounds = false,
      cursorline = {
        bold = false,
        bold_number = true,
        theme = 'dark',
        blend = 0.85,
      },
      noice = { style = 'flat' },
      telescope = { style = 'flat' },
      leap = { dim_backdrop = false },
      ts_context = { dark_background = true },
      on_highlight = function (highlights, palette) end
    }
    vim.cmd.colorscheme("nordic")
  end
}

