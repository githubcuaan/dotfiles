return vim.b.colorscheme ~= "everblush" and {} or {
  "Everblush/nvim",
  priority = 100,
  config = function ()
   vim.cmd.colorscheme("everblush")
  end
}
