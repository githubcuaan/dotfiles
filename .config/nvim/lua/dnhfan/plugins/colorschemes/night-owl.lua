return vim.b.colorscheme ~= "night-owl" and {} or {
  "oxfist/night-owl.nvim",
  priority = 100,
  config = function()
    require("night-owl").setup({
      bold = true,
      italics = false,
      underline = true,
      undercurl = true,
      transparent_background = false,
    })
    vim.cmd.colorscheme("night-owl")
  end
}
