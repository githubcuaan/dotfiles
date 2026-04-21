local Key = {}

Key.cmp = {
  preset = "none",

  ["<Tab>"] = { "snippet_forward", "fallback" },
  ["<S-Tab>"] = { "snippet_backward", "fallback" },

  ["<C-y>"] = { "select_and_accept", "fallback" },
  ["<C-n>"] = { "select_next", "fallback" },
  ["<C-p>"] = { "select_prev", "fallback" },
  ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
  ["<C-e>"] = { "hide" },
  ["<C-d>"] = { "scroll_documentation_down" },
  ["<C-u>"] = { "scroll_documentation_up" },
}


Key.cmdline = {
  preset = "none",

  ["<Tab>"] = { "snippet_forward", "fallback" },
  ["<S-Tab>"] = { "snippet_backward", "fallback" },

  ["<C-y>"] = { "select_and_accept", "fallback" },
  ["<C-n>"] = { "select_next", "fallback" },
  ["<C-p>"] = { "select_prev", "fallback" },
  ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
  ["<C-e>"] = { "hide" },
  ["<C-d>"] = { "scroll_documentation_down" },
  ["<C-u>"] = { "scroll_documentation_up" },
}

return Key
