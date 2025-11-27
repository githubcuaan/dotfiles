return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "InsertEnter",
        opts = { updateevents = "TextChanged,TextChangedI" },

        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
          require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

          -- snipmate format
          require("luasnip.loaders.from_snipmate").load()
          require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

          -- lua format
          require("luasnip.loaders.from_lua").load()
          require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })
          vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
              if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
              then
                require("luasnip").unlink_current()
              end
            end,
          })
        end,
      },
    },
    version = "*",
    opts = {
      enabled = function()
        local filetypes = {
          "toggleterm",
          "NvimTree",
          "Telescope",
          "TelescopePrompt",
          "Avante",
          "AvanteInput",
          "AvantePromptInput",
        }

        return not vim.tbl_contains(filetypes, vim.bo.filetype)
      end,
      keymap = {
        preset = "none",

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-y>"] = { "select_and_accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-d>"] = { "scroll_documentation_down" },
        ["<C-u>"] = { "scroll_documentation_up" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      completion = {
        trigger = {
          prefetch_on_insert = false,
          show_in_snippet = true,
          show_on_keyword = true,
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
          show_on_accept_on_trigger_character = true,
          blocked_trigger_characters = { "'", '"', "(", ">" },
        },
        accept = {
          create_undo_point = true,
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          cmdline_position = function()
            if vim.g.ui_cmdline_pos ~= nil then
              local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
              return { pos[1] - 1, pos[2] }
            end
            local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
            return { vim.o.lines - height, 0 }
          end,
          auto_show = true,
          scrollbar = true,
          scrolloff = 2,
          border = require("dnhfan.core.utils").border,
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
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
              { "label", "label_description", gap = 1 },
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
        },
        documentation = {
          auto_show = true,
          treesitter_highlighting = true,
          auto_show_delay_ms = 200,
          window = {
            border = require("dnhfan.core.utils").border,
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          },
        },
        ghost_text = { enabled = false },
        list = {
          max_items = 20,
          selection = {
            preselect = true,
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          treesitter_highlighting = true,
          border = require("dnhfan.core.utils").border,
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
      snippets = {
        preset = "luasnip",
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = "none",

          ["<Tab>"] = { "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "snippet_backward", "fallback" },

          ["<C-y>"] = { "select_and_accept", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<C-e>"] = { "hide" },
          ["<C-d>"] = { "scroll_documentation_down" },
          ["<C-u>"] = { "scroll_documentation_up" },
        },
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          if type == ":" then
            return { "cmdline", "path" }
          end
          return {}
        end,
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
          },
          list = {
            selection = {
              preselect = true,
            },
          },
          menu = {
            auto_show = true, -- Inherits from top level `completion.menu.auto_show` config when not set
            draw = {
              columns = {
                { "kind_icon" },
                { "label", "label_description", gap = 1 },
                -- { 'source_name' },
              },
            },
          },
        },
      },
      sources = {
        default = {
          "lsp",
          "snippets",
          "path",
          "buffer",
        },
        providers = {
          lsp = { name = "LSP" },
          snippets = { name = "snippets" },
          path = { name = "path" },
          cmdline = {},
          buffer = {
            name = "buffer",
            max_items = 10,
            opts = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
