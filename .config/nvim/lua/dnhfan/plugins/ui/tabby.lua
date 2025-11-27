return {
  "nanozuki/tabby.nvim",
  config = function()
    -- 0. PHÍM TẮT
    -- Loop từ 1 đến 9, map <Leader> + số để nhảy tab
    for i = 1, 9 do
      vim.keymap.set("n", "<leader>t" .. i, function()
        vim.cmd("tabnext " .. i)
      end, { desc = "Tabby: Nhảy ngay tới tab " .. i })
    end

    -- Bonus: Map thêm phím 0 để nhảy về tab cuối cùng (thường là tab mới nhất)
    vim.keymap.set("n", "<leader>t0", ":tablast<CR>", { desc = "Tabby: Nhảy tới tab cuối cùng" })

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
              -- tab.name(),
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
