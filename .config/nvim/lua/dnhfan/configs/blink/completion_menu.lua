return {
  cmdline_position = function()
    if vim.g.ui_cmdline_pos ~= nil then
      local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
      return { pos[1] - 1, pos[2] }
    end
    -- local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
    local height = 2
    return { vim.o.lines - height, 0 }
  end,
  auto_show = true,
  scrollbar = true,
  scrolloff = 2,
  border = require("dnhfan.core.utils").border,
  winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
  draw = {
    padding = 1,
    gap = 2,
    treesitter = {
      "lsp",
      "luasnip",
      "snippets",
      "path",
      "buffer",
      "cmdline",
    },
    columns = {
      { "kind_icon" },
      { "label",    "label_description", gap = 1 },
      -- { 'source_name' },
    },
    components = {
      source_name = {
        text = function(ctx)
          return ctx.source_name:gsub("^%l", string.upper)
        end,
        highlight = "BlinkCmpSource",
      },
      kind_icon = {
        text = function(ctx)
          local kind_icon = require("dnhfan.core.utils").nv_chad_icons[ctx.kind]
          return kind_icon
        end,
      },
    },
  },
}
