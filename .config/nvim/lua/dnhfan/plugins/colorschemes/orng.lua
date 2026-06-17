return vim.b.colorscheme ~= "orng" and {} or {
  "roerohan/orng.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("orng").setup({
      variant = "dark", -- "dark" or "light"
      transparent = true,
      italic_comment = true,
    })
    vim.cmd("colorscheme orng")
  end,
}
