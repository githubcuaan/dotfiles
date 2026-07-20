return {
  view = "hover",
  opts = {
    lang = "markdown",
    replace = true,
    render = "plain",
    format = { "{message}" },
    border = {
      style = "rounded",
      padding = { top = 0, bottom = 0, left = 1, right = 1 },
    },
    win_options = {
      concealcursor = "n",
      conceallevel = 3,
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    },
  },
}
