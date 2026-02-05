return {
  -- VIM-SLIME (Shipper)
  {
    "jpalardy/vim-slime",
    lazy = false, -- Load ngay lập tức khi bật Neovim
    init = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = { socket_name = "default", target_pane = "2" }
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_bracketed_paste = 1
    end,
  },
}
