-- lualine:

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local sign_icon = require("dnhfan.core.utils").sign_icons
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {
            "toggleterm",
            "nvimtree",
            "telescope",
            "avante",
            "avanteinput",
            "avantepromptinput",
          },
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 300,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            function()
              return ""
            end,
            padding = 0,
            separator = { left = "", right = "█" },
            draw_empty = true,
          },
          {
            function()
              return "dnhfan"
            end,
            icon = "",
            color = function()
              local opts = {}
              if vim.g.terminal_color_4 then
                opts.fg = vim.g.terminal_color_4
              end
              return opts
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
            color = function()
              local opt = {}
              if vim.g.terminal_color_1 then
                opt.fg = vim.g.terminal_color_1
              end
              return opt
            end,
          },
        },
        lualine_c = {},
        lualine_x = {
          {
            "diagnostics",
            color = {
              bg = "none",
            },
            icon = {
              " :",
              color = {
                fg = vim.opt.background._value == "light" and require("utils").light_palette.red
                  or require("dnhfan.core.utils").dark_palette.red, -- default to red if terminal color is not set
                bg = "none", -- no background color
              },
              -- color = function ()
              --   local opt = {}
              --   if vim.g.terminal_color_1 then
              --     opt.fg = vim.g.terminal_color_1
              --     opt.bg = "none"
              --   end
              --   return opt
              -- end
            },
            padding = 1,
            sources = { "nvim_diagnostic", "coc" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
              error = "diagnosticsignerror", -- changes diagnostics' error color.
              warn = "diagnosticsignwarn", -- changes diagnostics' warn color.
              info = "diagnosticsigninfo", -- changes diagnostics' info color.
              hint = "diagnosticsignhint", -- changes diagnostics' hint color.
            },
            symbols = {
              error = sign_icon.error .. " ",
              warn = sign_icon.warning .. " ",
              info = sign_icon.info .. " ",
              hint = sign_icon.hint .. " ",
            },
            colored = true, -- displays diagnostics status in color if set to true.
            update_in_insert = false, -- update diagnostics in insert mode.
            always_visible = false, -- show diagnostics even if there are none.
          },
          {
            "diff",
            color = {
              bg = "none",
            },
            icon = {
              " :",
              color = {
                fg = vim.opt.background._value == "light" and require("dnhfan.core.utils").light_palette.red
                  or require("dnhfan.core.utils").dark_palette.red, -- default to red if terminal color is not set
                bg = nil, -- no background color
              },
              -- color = function ()
              --   local opt = {}
              --   if vim.g.terminal_color_1 then
              --     opt.fg = vim.g.terminal_color_1
              --     opt.bg = nil
              --   end
              --   return opt
              -- end
            },
            padding = 1,
            colored = true, -- displays a colored diff status if set to true
            diff_color = {
              added = "gitsignsadd", -- changes the diff's added color
              modified = "gitsignschange", -- changes the diff's modified color
              removed = "gitsignsdelete", -- changes the diff's removed color you
            },
            symbols = {
              removed = sign_icon.delete .. " ",
              modified = sign_icon.change .. " ",
              added = sign_icon.add .. " ",
            },
            -- source = nil, -- a function that works as a data source for diff.
          },
        },
        lualine_y = {
          {
            "filetype",
            colored = true, -- displays filetype icon in color if set to true
            icon_only = false, -- display only an icon for filetype
            icon = { align = "left" },
            fmt = function()
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
            end,
          },
          -- {
          --   function ()
          --     local curr_line = vim.fn.line('.')
          --     local lines = vim.fn.line('$')
          --     local sbar = require("utils").sbar
          --     local divide = curr_line / lines
          --     local percentage = curr_line == 1 and "top"
          --     or curr_line == lines
          --     and "bot"
          --     or require("init").round(divide * 100) .. '%%'
          --     local i = require("init").round(divide * #sbar)
          --     i = i == 0 and 1 or i
          --
          --     return percentage .. ' ' .. sbar[i]
          --   end,
          --   color = function ()
          --     local opts = {}
          --     if vim.g.terminal_color_3 then
          --       opts.fg = vim.g.terminal_color_3
          --     end
          --     return opts
          --   end
          -- },
        },
        lualine_z = {
          -- {
          --   function () return "" end,
          --   padding = 0,
          --   separator = { left = "", right = "█" },
          --   draw_empty = true,
          -- },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      -- tabline = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {
      --     {
      --       "buffers",
      --       padding = 1,
      --       -- separator = { left = '', right = ''},
      --       show_filename_only = true,
      --       hide_filename_extension = false,
      --       show_modified_status = true,
      --       use_mode_colors = true,
      --       mode = 0,
      --       max_length = vim.o.columns,
      --       buffers_color = {
      --         active = "lualine_a_normal",
      --         inactive = "lualine_a_inactive",
      --       },
      --       symbols = {
      --         modified = " ●", -- text to show when the buffer is modified
      --         alternate_file = "", -- text to show to identify the alternate file
      --         directory = "", -- text to show when the buffer is a directory
      --       },
      --     },
      --   },
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      -- winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      -- inactive_winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      -- },
      extensions = {
        "neo-tree",
        "toggleterm",
        "lazy",
        "mason",
        "nvim-tree",
      },
    })
  end,
}
