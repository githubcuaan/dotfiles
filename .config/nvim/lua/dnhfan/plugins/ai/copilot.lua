return {
  "github/copilot.vim",
  event = "InsertEnter", -- Lazy tự load khi vào Insert, không cần gọi hàm load nữa

  -- init before plugin load
  init = function()
    vim.g.copilot_no_tab_map = true
  end,

  config = function()
    -- Dùng vim.keymap.set (API mới) thay vì nvim_set_keymap
    -- replace_keycodes = false là quan trọng để expr hoạt động mượt với copilot
    vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
  end,
}
