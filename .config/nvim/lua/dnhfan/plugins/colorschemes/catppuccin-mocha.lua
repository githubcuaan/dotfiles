return vim.b.colorscheme ~= "catppuccin-mocha" and {}
    or {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000, -- Đảm bảo theme được load đầu tiên
      config = function()
        require("catppuccin").setup({
          flavour = "mocha", -- latte, frappe, macchiato, mocha
          background = {
            light = "latte",
            dark = "mocha",
          },
          transparent_background = true, -- Hiệu ứng xuyên thấu cực chill
          show_end_of_buffer = false,
          term_colors = true,
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = true,
            mini = {
              enabled = true,
              indentscope_color = "rosewater",
            },
          },
        })

        -- Kích hoạt theme ngay sau khi setup
        vim.cmd.colorscheme "catppuccin"
      end,
    }
