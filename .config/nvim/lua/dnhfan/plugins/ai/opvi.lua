return {
  dir = "/home/andev/projects/opvi",
  name = "opvi.nvim",
  cmd = {
    "OpviConnect",
    "OpviAsk",
    "OpviDisconnect",
  },
  dependencies = {
    "folke/snacks.nvim",
  },
  opts = {
    tmux = {
      manager_path = "/home/andev/projects/tmux-opencode-session-manager",
    },
    lualine = {
      fg = '#585858', -- xám mặc định, dùng chung mọi trạng thái
      max_width = 20, -- 0 = không cắt
      connected = '󰚩',
      idle = '󱚧',
    },
  },
  keys = {
    {
      "<leader>ca",
      function()
        require("opvi").ask("@this: ")
      end,
      mode = { "n", "x" },
      desc = "Ask OpenCode (selection/line)",
    },
    {
      "<leader>cb",
      function()
        require("opvi").ask("@buffer: ")
      end,
      desc = "Ask OpenCode (buffer)",
    },
  },
}
