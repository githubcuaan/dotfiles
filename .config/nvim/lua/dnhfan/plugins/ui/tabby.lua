return {
  "nanozuki/tabby.nvim",
  config = function()
    -- 1. ĐỊNH NGHĨA THEME (TÁCH BIỆT)
    local theme = {
      fill = "TabLineFill",
      head = "TabLine",
      current_tab = "TabLineSel", -- Màu cho tab đang active
      tab = "TabLine", -- Màu cho các tab inactive
      win = "TabLine",
      tail = "TabLine",
    }

    -- 2. SETUP VÀ DÙNG THEME
    require("tabby").setup({
      line = function(line)
        return {
          -- [A] PHẦN ĐẦU (HEAD)
          {
            { "    ", hl = theme.head },
            line.sep("", theme.head, theme.fill),
          },

          -- [B] DANH SÁCH TABS
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("", hl, theme.fill),
              tab.is_current() and "" or "󰆣", -- Icon cho Active/Inactive Tab
              tab.number(),
              tab.name(),
              tab.close_btn(""),
              line.sep("", hl, theme.fill),
              hl = hl,
              margin = " ",
            }
          end),

          -- [C] KHOẢNG TRỐNG
          line.spacer(),

          -- [D] DANH SÁCH WINDOWS/BUFFERS TRONG TAB HIỆN TẠI
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep("", theme.win, theme.fill),
              win.is_current() and "" or "", -- Icon cho Active/Inactive Window/Buffer
              win.buf_name(),
              line.sep("", theme.win, theme.fill),
              hl = theme.win,
              margin = " ",
            }
          end),

          -- [E] PHẦN ĐUÔI (TAIL)
          {
            line.sep("", theme.tail, theme.fill),
            { "  ", hl = theme.tail },
          },

          hl = theme.fill, -- Màu nền chung
        }
      end,
    })
  end,
}
