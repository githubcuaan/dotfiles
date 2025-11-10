return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    require("lazy").load({ plugins = { "copilot.vim" } })

    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
  end,
}
