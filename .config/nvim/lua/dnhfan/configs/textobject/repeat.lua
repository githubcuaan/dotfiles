local H = require("dnhfan.configs.textobject.helpers")
local ts_repeat_move = H.ts_repeat_move
local map = H.map

-- ========================================================================
-- 5. REPEAT (Lặp lại)
-- ========================================================================

-- ; sẽ luôn đi tới (Forward), , sẽ luôn đi lùi (Backward)
-- Bất kể lệnh trước đó là ]m hay [m
map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next, "[Text Object]: Repeat last move (next)")
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, "[Text Object]: Repeat last move (prev)")

-- Nếu ông muốn ; lặp lại theo hướng cũ (Vim way) thì mở comment 2 dòng dưới, đóng 2 dòng trên
-- map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Làm cho f, F, t, T cũng lặp lại được bằng ; và ,
-- LƯU Ý: Phải dùng `builtin_..._expr` và `{ expr = true }` mới đúng chuẩn Doc
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr,
  { expr = true, desc = "[Text Object]: Find char forward" })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr,
  { expr = true, desc = "[Text Object]: Find char backward" })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr,
  { expr = true, desc = "[Text Object]: Until char forward" })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr,
  { expr = true, desc = "[Text Object]: Until char backward" })
