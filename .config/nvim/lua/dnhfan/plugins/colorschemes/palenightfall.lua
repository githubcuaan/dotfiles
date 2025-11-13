return vim.b.colorscheme ~= "palenightfall" and {} or {
  "JoosepAlviste/palenightfall.nvim",
  priority = 100,
  config = function()
    vim.cmd.colorscheme("palenightfall")
  end
}
