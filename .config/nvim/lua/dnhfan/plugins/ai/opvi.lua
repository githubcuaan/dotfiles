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
