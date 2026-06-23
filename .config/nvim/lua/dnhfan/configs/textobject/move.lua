local H = require("dnhfan.configs.textobject.helpers")
local move = H.move
local map = H.map

-- ========================================================================
-- 4. MOVE (Di chuyển)
-- ========================================================================

-- --- Function (Hàm) ---
-- ]m : Đi tới đầu hàm tiếp theo
map({ "n", "x", "o" }, "]m", function()
  move.goto_next_start("@function.outer")
end, "[Text Object]: Next function start")

-- ]M : Đi tới cuối hàm tiếp theo
map({ "n", "x", "o" }, "]M", function()
  move.goto_next_end("@function.outer")
end, "[Text Object]: Next function end")

-- [m : Lùi lại đầu hàm trước đó
map({ "n", "x", "o" }, "[m", function()
  move.goto_previous_start("@function.outer")
end, "[Text Object]: Prev function start")

-- [M : Lùi lại cuối hàm trước đó
map({ "n", "x", "o" }, "[M", function()
  move.goto_previous_end("@function.outer")
end, "[Text Object]: Prev function end")


-- --- Class (Lớp) ---
-- ]] : Đi tới đầu class tiếp theo
map({ "n", "x", "o" }, "]]", function()
  move.goto_next_start("@class.outer")
end, "[Text Object]: Next class start")

-- ][ : Đi tới cuối class tiếp theo
map({ "n", "x", "o" }, "][", function()
  move.goto_next_end("@class.outer")
end, "[Text Object]: Next class end")

-- [[ : Lùi lại đầu class trước đó
map({ "n", "x", "o" }, "[[", function()
  move.goto_previous_start("@class.outer")
end, "[Text Object]: Prev class start")

-- [] : Lùi lại cuối class trước đó
map({ "n", "x", "o" }, "[]", function()
  move.goto_previous_end("@class.outer")
end, "[Text Object]: Prev class end")


-- --- Loop (Vòng lặp) ---
map({ "n", "x", "o" }, "]l", function()
  move.goto_next_start("@loop.outer")
end, "[Text Object]: Next loop start")
map({ "n", "x", "o" }, "[l", function()
  move.goto_previous_start("@loop.outer")
end, "[Text Object]: Prev loop start")


-- --- Conditional (If/Else) ---
map({ "n", "x", "o" }, "]i", function()
  move.goto_next_start("@conditional.outer")
end, "[Text Object]: Next conditional start")
map({ "n", "x", "o" }, "[i", function()
  move.goto_previous_start("@conditional.outer")
end, "[Text Object]: Prev conditional start")


-- --- Scope (Phạm vi) & Fold ---
map({ "n", "x", "o" }, "]s", function()
  move.goto_next_start("@local.scope")
end, "[Text Object]: Next scope")
map({ "n", "x", "o" }, "]z", function()
  move.goto_next_start("@fold")
end, "[Text Object]: Next fold")
