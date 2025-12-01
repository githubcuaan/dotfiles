--

return {
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      -- 1. Load module
      local dropbar_api = require("dropbar.api")

      -- 2. Set key map
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Dropbar: Pick symbols ở winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Dropbar: Nhảy đến đầu context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Dropbar: Chọn next context" })

      -- 3. THEME CUSTOMIZATION (Phần quan trọng đây)
      -- Bảng màu Nord tham khảo:
      -- Polar Night: #2E3440, #3B4252, #434C5E, #4C566A
      -- Snow Storm: #D8DEE9, #E5E9F0, #ECEFF4
      -- Frost: #8FBCBB, #88C0D0, #81A1C1, #5E81AC

      -- Đổi màu icon phân cách (>) thành màu xanh nhạt Nord8 hoặc xám Nord3
      vim.api.nvim_set_hl(0, "DropBarIconUISeparator", { fg = "#81A1C1" })

      -- Đổi màu text bình thường thành màu trắng xám Nord4
      vim.api.nvim_set_hl(0, "DropBarKindNormal", { fg = "#D8DEE9" })

      -- Khi hover vào menu chọn, nền chuyển màu xám đậm (Nord2) cho dễ nhìn
      vim.api.nvim_set_hl(0, "DropBarMenuHoverEntry", { fg = "#88C0D0", bg = "#434C5E", bold = true })

      vim.api.nvim_set_hl(0, "WinBar", { bg = "#3B4252", fg = "#D8DEE9" })
      -- Nếu bác dùng dropbar đè lên WinBarNC (lúc không focus) thì set luôn:
      vim.api.nvim_set_hl(0, "WinBarNC", { bg = "#2E3440", fg = "#4C566A" })

      -- Chỉnh màu nền cho cái Menu xổ xuống (Dropdown Menu)
      vim.api.nvim_set_hl(0, "DropBarMenuNormalFloat", { bg = "#3B4252", fg = "#ECEFF4" })

      -- Viền của menu xổ xuống (cho đồng bộ)
      vim.api.nvim_set_hl(0, "DropBarMenuFloatBorder", { fg = "#81A1C1", bg = "#3B4252" })
    end,
  },
}
