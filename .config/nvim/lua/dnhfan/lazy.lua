local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "dnhfan.plugins.colorschemes" },
  { import = "dnhfan.plugins.ai" },
  { import = "dnhfan.plugins.lsp" },
  { import = "dnhfan.plugins.completion" },
  { import = "dnhfan.plugins.language" },
  { import = "dnhfan.plugins.editor" },
  { import = "dnhfan.plugins.navigation" },
  { import = "dnhfan.plugins.git" },
  { import = "dnhfan.plugins.ui" },
  { import = "dnhfan.plugins.tools" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
