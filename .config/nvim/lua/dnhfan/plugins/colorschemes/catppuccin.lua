-- catppuccin theme

return vim.b.colorscheme ~= "catppuccin" and {}
  or {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  }
