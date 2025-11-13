return vim.b.colorscheme ~= "poimandres" and {} or {
  "olivercederborg/poimandres.nvim",
  priority = 100,
  config = function ()
    require("poimandres").setup({
      bold_vert_split = false, -- use bold vertical separators
      dim_nc_background = false, -- dim 'non-current' window backgrounds
      disable_background = false, -- disable background
      disable_float_background = false, -- disable background for floats
      disable_italics = false, -- disable italics
    })
    vim.cmd.colorscheme("poimandres")
  end
}
