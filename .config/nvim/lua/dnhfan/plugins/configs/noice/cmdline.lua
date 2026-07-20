return {
  enabled = true,
  view = "cmdline_popup",
  opts = {
  },

  format = {
    cmdline    = { pattern = "^:", icon = " ", lang = "vim" },
    -- search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
    -- search_up   = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    -- filter      = { pattern = "^:%s*!", icon = "$", lang = "bash" },
    -- lua         = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
    -- help        = { pattern = "^:%s*he?l?p?%s+", icon = "" },
    calculator = { pattern = "^=", icon = "󰪚 ", lang = "vimnormal" },
    input      = { view = "cmdline_input", icon = "󰥻 " },
  },
}
