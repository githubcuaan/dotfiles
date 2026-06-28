-- Direction when typing arg

return {
  enabled = true,
  auto_open = {
    enabled = true,
    trigger = true,
    luasnip = true,
    throttle = 50,
  },

  view = nil,

  opts = {
    border = {
      style = "rounded",
      padding = { top = 0, bottom = 0, left = 1, right = 1 },
    },
    win_options = {
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    },
  },
}
