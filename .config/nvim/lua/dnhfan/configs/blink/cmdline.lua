return {
  enabled = true,
  keymap = require("dnhfan.configs.blink.keymap").cmdline,
  sources = function()
    local type = vim.fn.getcmdtype()
    if type == "/" or type == "?" then
      return { "buffer" }
    end
    if type == ":" then
      return { "cmdline", "path" }
    end
    return {}
  end,
  completion = {
    trigger = {
      show_on_blocked_trigger_characters = {},
      show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
    },
    list = {
      selection = {
        preselect = true,
      },
    },
    menu = {
      auto_show = false, -- Inherits from top level `completion.menu.auto_show` config when not set
      draw = {
        columns = {
          { "kind_icon" },
          { "label",    "label_description", gap = 1 },
          -- { 'source_name' },
        },
      },
    },
  },
}
