return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move left" },
    { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move down" },
    { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move up" },
    { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move right" },
    { "<M-h>", function() require("smart-splits").resize_left() end, desc = "Resize left" },
    { "<M-j>", function() require("smart-splits").resize_down() end, desc = "Resize down" },
    { "<M-k>", function() require("smart-splits").resize_up() end, desc = "Resize up" },
    { "<M-l>", function() require("smart-splits").resize_right() end, desc = "Resize right" },
  },
  config = function()
    require("smart-splits").setup({
      default_amount = 3, -- Mỗi lần resize nhảy 3 cột/dòng
      at_edge = 'wrap',   -- Kịch lề sẽ nhảy sang phía đối diện
    })
  end,
}
