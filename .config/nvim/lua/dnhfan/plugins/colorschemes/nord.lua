return vim.b.colorscheme ~= "nord" and {}
    or {
      "gbprod/nord.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("nord").setup({
          transparent = true, -- Nền trong suốt
          terminal_colors = true,
          diff = { mode = "bg" },
          borders = true,
          errors = { mode = "bg" },
          search = { theme = "vim" },
          styles = {
            comments = { italic = true },
            keywords = {},
            functions = {},
            variables = {},
            bufferline = {
              current = {},
              modified = { italic = true },
            },
            lualine_bold = false,
          },
          colorblind = {
            enable = false,
            preserve_background = false,
            severity = {
              protan = 0.0,
              deutan = 0.0,
              tritan = 0.0,
            },
          },
          on_colors = function(colors) end,

          -- Ghi đè highlight (Giải pháp cho lỗi chữ chìm vào nền)
          on_highlights = function(highlights)
            local custom_gray = "#7b88a1"
            -- local custom_gray = "#8b98b1"
            highlights["@comment"] = { fg = custom_gray, italic = true }
            highlights.Comment = { fg = custom_gray, italic = true }
            -- highlights.NonText = { fg = colors.nord4 }

            -- Tô màu cho vạch chia màn hình (Split windows)
            highlights.WinSeparator = { fg = custom_gray }

            -- Tô màu cho viền cửa sổ nổi (Floating windows)
            highlights.FloatBorder = { fg = custom_gray }

            -- FIX MÀU SỐ DÒNG
            -- Màu cho tất cả các số dòng bình thường
            highlights.LineNr = { fg = custom_gray }

            -- (Tùy chọn) Màu cho số dòng hiện tại con trỏ đang đứng
            -- Nên để màu sáng hẳn (như trắng/xám sáng của nord4) và in đậm để dễ định vị
            highlights.CursorLineNr = { fg = "#D8DEE9", bold = true }
          end,
        })

        vim.cmd.colorscheme("nord")
      end,
    }
