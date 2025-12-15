return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- 1. Dùng preset "modern" cho đẹp (nó tự có border bo cong nhẹ)
    preset = "modern",

    -- 2. Config chi tiết cho cửa sổ
    win = {
      -- Border: "rounded" (cong), "single" (mảnh), "double" (đôi), "shadow" (bóng)
      border = "rounded",
      -- Padding bên trong cho thoáng
      padding = { 2, 2 },
      -- Title hiển thị ở trên border (nếu thích)
      title = true,
      title_pos = "center",
      zindex = 1000,
    },

    -- 3. Layout: Cái này quan trọng để định vị
    layout = {
      height = { min = 4, max = 25 },
      -- Giới hạn chiều rộng: Đừng để nó full màn hình
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "center",
    },
  },
}
