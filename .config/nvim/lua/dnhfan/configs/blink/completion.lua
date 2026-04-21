return {
  trigger = {
    prefetch_on_insert = false,
    show_in_snippet = true,
    show_on_keyword = true,
    show_on_trigger_character = true,
    show_on_insert_on_trigger_character = true,
    show_on_accept_on_trigger_character = true,
  },
  accept = {
    create_undo_point = true,
    auto_brackets = {
      enabled = true,
    },
  },
  menu = require("dnhfan.configs.blink.completion_menu"),

  documentation = {
    auto_show = true,
    treesitter_highlighting = true,
    auto_show_delay_ms = 200,
    window = {
      border = require("dnhfan.core.utils").border,
      winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
    },
  },


  ghost_text = { enabled = false },
  list = {
    max_items = 20,
    selection = {
      preselect = true,
    },
  },
}
