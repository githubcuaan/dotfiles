return {
  popupmenu = {
    relative = "editor",
    zindex = 65,
    position = {
      row = "auto",
      col = "auto",
    },
    size = {
      width = "auto",
      height = "auto",
      max_height = 20,
      min_width = 30,
    },
    border = {
      style = "rounded",
      padding = { 0, 1 },
    },
    win_options = {
      winbar = "",
      foldenable = false,
      cursorline = true,
      cursorlineopt = "line",
      winhighlight = {
        Normal = "NormalFloat",
        FloatBorder = "FloatBorder",
        CursorLine = "Visual",
        PmenuMatch = "Special",
      },
    },
  },
  cmdline_popupmenu = {
    view = "popupmenu",
    zindex = 200,
  },
  virtualtext = {
    backend = "virtualtext",
    format = { "{message}" },
    hl_group = "DiagnosticVirtualTextInfo",
  },
  notify = {
    backend = { "snacks", "notify" },
    fallback = "mini",
    format = "notify",
    replace = false,
    merge = false,
  },
  split = {
    backend = "split",
    enter = false,
    relative = "editor",
    position = "bottom",
    size = "20%",
    close = {
      keys = { "q" },
    },
    win_options = {
      winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
      wrap = true,
    },
  },
  cmdline_output = {
    format = "details",
    view = "split",
  },
  messages = {
    view = "split",
    enter = true,
  },
  vsplit = {
    view = "split",
    position = "right",
  },
  popup = {
    backend = "popup",
    relative = "editor",
    close = {
      events = { "BufLeave" },
      keys = { "q" },
    },
    enter = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "120",
      height = "20",
    },
    win_options = {
      winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
      winbar = "",
      foldenable = false,
    },
  },
  hover = {
    view = "popup",
    relative = "cursor",
    zindex = 45,
    enter = false,
    anchor = "auto",
    size = {
      width = "auto",
      height = "auto",
      max_height = 20,
      max_width = 120,
    },
    border = {
      style = "rounded",
      padding = { 0, 2 },
    },
    position = { row = 1, col = 0 },
    win_options = {
      wrap = true,
      linebreak = true,
    },
  },
  cmdline = {
    backend = "popup",
    relative = "editor",
    position = {
      row = "100%",
      col = 0,
    },
    size = {
      height = "auto",
      width = "100%",
    },
    border = {
      style = "none",
    },
    win_options = {
      winhighlight = {
        Normal = "NormalFloat",
        IncSearch = "",
        CurSearch = "",
        Search = "",
      },
    },
  },
  mini = {
    backend = "mini",
    relative = "editor",
    align = "message-right",
    timeout = 2000,
    reverse = true,
    focusable = false,
    position = {
      row = -1,
      col = "100%",
    },
    size = {
      width = "auto",
      height = "auto",
      max_height = 10,
    },
    border = {
      style = "none",
    },
    zindex = 60,
    win_options = {
      winbar = "",
      foldenable = false,
      winblend = 30,
      winhighlight = {
        Normal = "NormalFloat",
        IncSearch = "",
        CurSearch = "",
        Search = "",
      },
    },
  },
  cmdline_popup = {
    backend = "popup",
    relative = "editor",
    focusable = false,
    enter = false,
    zindex = 200,
    position = {
      row = "50%",
      col = "50%",
    },
    size = {
      min_width = 60,
      width = "auto",
      height = "auto",
    },
    border = {
      style = "rounded",
      padding = { 0, 1 },
    },
    win_options = {
      winhighlight = {
        Normal = "NormalFloat",
        FloatTitle = "Title",
        FloatBorder = "FloatBorder",
        IncSearch = "",
        CurSearch = "",
        Search = "",
      },
      winbar = "",
      foldenable = false,
      cursorline = false,
    },
  },
  cmdline_input = {
    view = "cmdline_popup",
    border = {
      style = "rounded",
      padding = { 0, 1 },
    },
  },
  confirm = {
    backend = "popup",
    relative = "editor",
    focusable = false,
    align = "center",
    enter = false,
    zindex = 210,
    format = { "{confirm}" },
    position = {
      row = 3,
      col = "50%",
    },
    size = "auto",
    border = {
      style = "rounded",
      padding = { 0, 1 },
      text = {
        top = " Confirm ",
      },
    },
    win_options = {
      winhighlight = {
        Normal = "NormalFloat",
        FloatBorder = "FloatBorder",
      },
      winbar = "",
      foldenable = false,
    },
  },
}
