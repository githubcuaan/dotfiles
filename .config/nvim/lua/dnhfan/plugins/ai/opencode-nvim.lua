return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    require("dnhfan.plugins.configs.opencode.snack_ui")
  },
  config = function()
    require("dnhfan.plugins.configs.opencode.server")

    vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

    require("dnhfan.plugins.configs.opencode.keymap")
  end,
}
