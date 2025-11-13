return vim.b.colorscheme ~= "oxocarbon" and {} or {
  "nyoom-engineering/oxocarbon.nvim",
  priority = 100,
  config = function ()
    vim.cmd.colorscheme "oxocarbon"
  end
}
