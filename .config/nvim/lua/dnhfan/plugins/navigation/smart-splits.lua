return {
  "smart-splits-nvim/smart-splits.nvim",
  version = "^3.0.0",
  lazy = false,
  dependencies = {
    { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
  },
  opts = {
    mux = { backend = "smart-splits-backend-tmux" },
    resize = { amount = 3 },
    move = { at_edge = "wrap" },
  },
  keys = {
    { "<C-h>", function() require("smart-splits").move_cursor_left() end,  desc = "Move left" },
    { "<C-j>", function() require("smart-splits").move_cursor_down() end,  desc = "Move down" },
    { "<C-k>", function() require("smart-splits").move_cursor_up() end,    desc = "Move up" },
    { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move right" },

    { "<M-h>", function() require("smart-splits").resize_left() end,       desc = "Resize left" },
    { "<M-j>", function() require("smart-splits").resize_down() end,       desc = "Resize down" },
    { "<M-k>", function() require("smart-splits").resize_up() end,         desc = "Resize up" },
    { "<M-l>", function() require("smart-splits").resize_right() end,      desc = "Resize right" },
  },
}
