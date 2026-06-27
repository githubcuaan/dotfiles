return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    require("dnhfan.configs.opencode.snack_ui")
  },
  config = function()
    require("dnhfan.configs.opencode.server")

    vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

    require("dnhfan.configs.opencode.keymap")
  end,
}
