return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  config = function()
    local smart_splits = require("smart-splits")

    smart_splits.setup({
      default_amount = 3, -- Mỗi lần resize nhảy 3 cột/dòng
      at_edge = 'wrap',   -- Kịch lề sẽ nhảy sang phía đối diện
    })

    vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left, { desc = "Move left" })
    vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down, { desc = "Move down" })
    vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up, { desc = "Move up" })
    vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right, { desc = "Move right" })

    vim.keymap.set('n', '<M-h>', smart_splits.resize_left, { desc = "Resize left" })
    vim.keymap.set('n', '<M-j>', smart_splits.resize_down, { desc = "Resize down" })
    vim.keymap.set('n', '<M-k>', smart_splits.resize_up, { desc = "Resize up" })
    vim.keymap.set('n', '<M-l>', smart_splits.resize_right, { desc = "Resize right" })
  end,
}
