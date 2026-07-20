return {
  enabled = true,
  char = "│", -- Nét dọc thanh mảnh cho toàn file
  hl = { "SnacksIndent1", "SnacksIndent2", "SnacksIndent3" },
  only_scope = false, -- Vẫn hiện mờ mờ các lề khác cho dễ nhìn
  only_current = true, -- Tối ưu hiệu năng, chỉ vẽ ở cửa sổ đang code

  -- Làm nổi bật block code đang đứng (sáng lên + gạch dưới đầu block)
  scope = {
    enabled = true,
    hl = { "SnacksIndentScope" },
    underline = true,
    char = "│",
    priority = 200,
  },

  -- ĐỈNH CAO UI: Vẽ khung vuông ôm trọn scope (như một cái hộp)
  chunk = {
    enabled = true,
    hl = { "SnacksIndentChunk" },
    char = {
      corner_top = "╭", -- Bo góc tròn cho nó sành điệu (thay vì ┌ vuông vức)
      corner_bottom = "╰", -- Bo góc dưới
      horizontal = "─", -- Nét ngang
      vertical = "│", -- Nét dọc
      arrow = "", -- Mũi tên chỉ chỏ cho ngầu
    },
  },

  -- Hiệu ứng chớp chớp mượt mà khi nhảy scope (Yêu cầu Neovim >= 0.10)
  animate = {
    enabled = vim.fn.has("nvim-0.10") == 1,
    style = "out",
    easing = "linear",
    duration = {
      step = 20,   -- Tốc độ chớp từng dòng
      total = 500, -- Tổng thời gian hiệu ứng
    },
  },
}
