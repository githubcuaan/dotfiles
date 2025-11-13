return vim.b.colorscheme ~= "nightfly" and {} or {
  "bluz71/vim-nightfly-colors",
  priority = 100,
  name = "nightfly",
  config = function()
    vim.g.nightflyVirtualTextColor = true
    vim.g.nightglyItalic = true
    vim.cmd.colorscheme "nightfly"
  end
}

