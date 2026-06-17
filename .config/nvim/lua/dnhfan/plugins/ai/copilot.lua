return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
      yaml = true,
    },
  },
  config = function(_, opts)
    local copilot = require("copilot")
    copilot.setup(opts)

    local command = require("copilot.command")
    command.disable()

    local is_enabled = false

    vim.keymap.set("n", "<leader>ct", function()
      if is_enabled then
        command.disable()
        is_enabled = false
        vim.notify("󱚧  Copilot Disabled", vim.log.levels.INFO, { title = "Copilot" })
      else
        command.enable()
        is_enabled = true
        vim.notify("󰚩  Copilot Enabled", vim.log.levels.INFO, { title = "Copilot" })
      end
    end, { desc = "Toggle Copilot Service" })
  end,
}
