-- catppuccin theme

return vim.b.colorscheme ~= "catppuccin" and {}
    or {
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "mocha", -- latte, frappe, macchiato, mocha
          background = {     -- :h background
            light = "latte",
            dark = "mocha",
          },
          transparent_background = true, -- disables setting the background color.
          float = {
            transparent = true,          -- enable transparent floating windows
            solid = true,                -- use solid styling for floating windows, see |winborder|
          },
          term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
          dim_inactive = {
            enabled = false,             -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15,           -- percentage of the shade to apply to the inactive window
          },
          no_italic = false,             -- Force no italic
          no_bold = false,               -- Force no bold
          no_underline = false,          -- Force no underline
          styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = { "italic" },
            functions = { "bold" },
            keywords = { "italic" },
            strings = {},
            variables = {},
            numbers = {},
            booleans = { "bold", "italic" },
            properties = {},
            types = { "italic" },
            operators = {},
          },

          color_overrides = {},
          custom_highlights = {},
          default_integrations = true,
          auto_integrations = true,
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            notify = false,
            mini = {
              enabled = true,
              indentscope_color = "",
            },
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
              },
              underlines = {
                errors = { "undercurl" },
                warnings = { "undercurl" },
                hints = { "underline" },
                information = { "underline" },
                ok = { "underline" },
              },
              inlay_hints = {
                background = true,
              },
            },
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
          },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
      end,
    }
