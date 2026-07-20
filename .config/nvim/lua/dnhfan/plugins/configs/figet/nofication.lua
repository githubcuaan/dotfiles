return {
  poll_rate = 10,                -- How frequently to update and render notifications
  filter = vim.log.levels.TRACE, -- Minimum notifications level
  history_size = 128,            -- Number of removed messages to retain in history
  override_vim_notify = true,    -- Automatically override vim.notify() with Fidget
  -- How to configure notification groups when instantiated
  configs = { default = require("fidget.notification").default_config },
  -- Conditionally redirect notifications to another backend
  redirect = function(msg, level, opts)
    if opts and opts.on_open then
      return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
    end
  end,

  -- Options related to how notifications are rendered as text
  view = {
    stack_upwards = true,    -- Display notification items from bottom to top
    icon_separator = " ",    -- Separator between group name and icon
    group_separator = "---", -- Separator between notification groups
    group_separator_hl = "NormalFloat",
    -- How to render notification messages
    render_message = function(msg, cnt)
      return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
    end,
  },

  -- Options related to the notification window and buffer
  window = {
    normal_hl = "Comment",                        -- Base highlight group in the notification window
    winblend = 0,                                 -- Background color opacity in the notification window
    border = require("dnhfan.core.utils").border, -- Border around the notification window
    border_hl = "FloatBorder",                    -- Highlight group for border
    zindex = 45,                                  -- Stacking priority of the notification window
    max_width = 0,                                -- Maximum width of the notification window (30% of editor width)
    max_height = 10,                              -- Maximum height of the notification window
    x_padding = 1,                                -- Padding from right edge of window boundary
    y_padding = 1,                                -- Padding from bottom edge of window boundary
    align = "bottom",                             -- How to align the notification window
    relative = "editor",                          -- What the notification window position is relative to
    tabstop = 8,
    avoid = { "NvimTree", "TestExplorer" }
  },

}
