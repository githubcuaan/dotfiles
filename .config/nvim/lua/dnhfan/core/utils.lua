local U = {}

U.dark_palette = {
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
}

U.light_palette = {
  rosewater = "#dc8a78",
  flamingo = "#dd7878",
  pink = "#ea76cb",
  mauve = "#8839ef",
  red = "#d20f39",
  maroon = "#e64553",
  peach = "#fe640b",
  yellow = "#df8e1d",
  green = "#40a02b",
  teal = "#179299",
  sky = "#04a5e5",
  sapphire = "#209fb5",
  blue = "#1e66f5",
  lavender = "#7287fd",
  text = "#4c4f69",
  subtext1 = "#5c5f77",
  subtext0 = "#6c6f85",
  overlay2 = "#7c7f93",
  overlay1 = "#8c8fa1",
  overlay0 = "#9ca0b0",
  surface2 = "#acb0be",
  surface1 = "#bcc0cc",
  surface0 = "#ccd0da",
  base = "#eff1f5",
  mantle = "#e6e9ef",
  crust = "#dce0e8",
}

U.terminal_dark_palette = {
  U.dark_palette.overlay0,
  U.dark_palette.red,
  U.dark_palette.green,
  U.dark_palette.yellow,
  U.dark_palette.blue,
  U.dark_palette.pink,
  U.dark_palette.sky,
  U.dark_palette.text,
  U.dark_palette.overlay1,
  U.dark_palette.red,
  U.dark_palette.green,
  U.dark_palette.yellow,
  U.dark_palette.blue,
  U.dark_palette.pink,
  U.dark_palette.sky,
  U.dark_palette.text,
}

U.terminal_light_palette = {
  U.light_palette.overlay0,
  U.light_palette.red,
  U.light_palette.green,
  U.light_palette.yellow,
  U.light_palette.blue,
  U.light_palette.pink,
  U.light_palette.sky,
  U.light_palette.text,
  U.light_palette.overlay1,
  U.light_palette.red,
  U.light_palette.green,
  U.light_palette.yellow,
  U.light_palette.blue,
  U.light_palette.pink,
  U.light_palette.sky,
  U.light_palette.text,
}

U.sign_icons = {
  -- add = '󰐖',
  -- change = '󱗜',
  -- delete = '󰍵',
  -- topdelete = '󰍵',
  -- changedelete = '󰇽',
  -- untracked = '󰐖',
  add = "󰐗",
  change = "󰻂",
  delete = "󰍶",
  topdelete = "󰍶",
  changedelete = "󰟃",
  untracked = "󰐗",

  success = "󰄳",
  info = "󰋼",
  error = "󰅙",
  hint = "󰋗",
  warning = "󰀨",
  warning_2 = "",
  warning_3 = "󰀨",

  -- info = '󰏬',
  -- warning = '󰀧',
  -- error = '󰅗',
  -- hint = '󰞋',
  -- success = '󰄲',
}

U.navic_icon = {
  File = "󰈙",
  Module = "",
  Namespace = "󰌗",
  Package = "",
  Class = "󰌗",
  Method = "󰆧",
  Property = "",
  Field = "",
  Constructor = "",
  Enum = "󰕘",
  Folder = "󰉋",
  Interface = "󰕘",
  Snippet = "",
  Function = "󰊕",
  Variable = "󰆧",
  Constant = "󰏿",
  String = "󰀬",
  Number = "󰎠",
  Text = "󰉿",
  Keyword = "󰌋",
  Boolean = "◩",
  Copilot = "",
  Codeium = "",
  TabNine = "",
  Array = "󰅪",
  Object = "󰅩",
  Key = "󰌋",
  Null = "󰟢",
  EnumMember = "",
  Struct = "󰌗",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
}

U.nv_chad_icons = {
  Namespace = "󰌗",
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Table = "",
  Object = "󰅩",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "󰟢",
  String = "󰉿",
  Calendar = "",
  Watch = "󰥔",
  Package = "",
  Copilot = "",
  Codeium = "",
  TabNine = "",
}

U.local_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Array = "[]",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
  TabNine = "󰂂",
  Copilot = "",
}

U.kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Array = "[]",
  Event = "",
  Operator = "",
  TypeParameter = "",
  TabNine = "󰂂",
  Copilot = " ",
}

-- NOTE: Lsp server list
U.lsp_servers = {
  -- "ts_ls", -- typescript
  "lua_ls", -- lua
  "cssls", -- css
  "jsonls", -- json
  "tailwindcss", -- tailwindcss
  "emmet_ls", -- emmet
  "html", -- html
  "dockerls", -- docker
  "docker_compose_language_service", -- docker-compose
  "angularls", -- angular
  "eslint", -- eslint
  -- "vuels"
  "svelte",
  "graphql",
  "prismals",
  -- "pyright", -- python
  "basedpyright", -- python
  "intelephense", -- php
  "clangd", -- c/c++
  "yamlls", -- yaml
}

--NOTE: lsp formatters
U.lsp_formatters = {
  "prettier", -- prettier formatter
  "stylua", -- lua formatter
  "isort", -- python formatter
  "black", -- python formatter
  "pylint",
  "eslint_d",
  "blade-formatter",
  "pretty-php",
  -- "ruff",
}

-- NOTE: Treesitter parser list
U.treesitter_parsers = {
  "lua",
  "javascript",
  "diff",
  "typescript",
  "json",
  "html",
  "css",
  "scss",
  "angular",
  "bash",
  "dockerfile",
  "regex",
  "vimdoc",
  "vue",
  "xml",
  "yaml",
  "tsx",
  "prisma",
  "markdown",
  "markdown_inline",
  "svelte",
  "graphql",
  "bash",
  "vim",
  "gitignore",
  "query",
  "c",
  "php",
}

U.spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
U.spinner_circle = { "", "󰀚", "" }
U.sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }

U.border = vim.g.doc_border_type == "single"
    and {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }
  or vim.g.doc_border_type == "double" and {
    { "╔", "FloatBorder" },
    { "═", "FloatBorder" },
    { "╗", "FloatBorder" },
    { "║", "FloatBorder" },
    { "╝", "FloatBorder" },
    { "═", "FloatBorder" },
    { "╚", "FloatBorder" },
    { "║", "FloatBorder" },
  }
  or vim.g.doc_border_type == "padding" and {
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
    { " ", "FloatBorder" },
  }
  or {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
  }

return U
