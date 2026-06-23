local H = require("dnhfan.configs.textobject.helpers")
local move = H.move
local map = H.map

-- CONVENTION:
--   ]=next  [=previous
--   m=function-start  M=function-end
--   ]]=class-start    ][=class-end     [[=class-start-prev  []=class-end-prev
--   l=loop  i=conditional  s=scope  z=fold

-- ========================================================================
-- 4. MOVE (Di chuyển)
-- ========================================================================

-- --- Function (Hàm) ---
-- ]m : Đi tới đầu hàm tiếp theo
map({ "n", "x", "o" }, "]m", function()
  move.goto_next_start("@function.outer")
end) -- Đi tới đầu hàm tiếp theo

-- ]M : Đi tới cuối hàm tiếp theo
map({ "n", "x", "o" }, "]M", function()
  move.goto_next_end("@function.outer")
end) -- Đi tới cuối hàm tiếp theo

-- [m : Lùi lại đầu hàm trước đó
map({ "n", "x", "o" }, "[m", function()
  move.goto_previous_start("@function.outer")
end) -- Lùi lại đầu hàm trước đó

-- [M : Lùi lại cuối hàm trước đó
map({ "n", "x", "o" }, "[M", function()
  move.goto_previous_end("@function.outer")
end) -- Lùi lại cuối hàm trước đó


-- --- Class (Lớp) ---
-- ]] : Đi tới đầu class tiếp theo
map({ "n", "x", "o" }, "]]", function()
  move.goto_next_start("@class.outer")
end) -- Đi tới đầu lớp tiếp theo

-- ][ : Đi tới cuối class tiếp theo
map({ "n", "x", "o" }, "][", function()
  move.goto_next_end("@class.outer")
end) -- Đi tới cuối lớp tiếp theo

-- [[ : Lùi lại đầu class trước đó
map({ "n", "x", "o" }, "[[", function()
  move.goto_previous_start("@class.outer")
end) -- Lùi lại đầu lớp trước đó

-- [] : Lùi lại cuối class trước đó
map({ "n", "x", "o" }, "[]", function()
  move.goto_previous_end("@class.outer")
end) -- Lùi lại cuối lớp trước đó


-- --- Loop (Vòng lặp) ---
map({ "n", "x", "o" }, "]l", function()
  move.goto_next_start("@loop.outer")
end) -- Đi tới đầu vòng lặp tiếp theo
map({ "n", "x", "o" }, "[l", function()
  move.goto_previous_start("@loop.outer")
end) -- Lùi lại đầu vòng lặp trước đó


-- --- Conditional (If/Else) ---
map({ "n", "x", "o" }, "]i", function()
  move.goto_next_start("@conditional.outer")
end) -- Đi tới đầu điều kiện tiếp theo
map({ "n", "x", "o" }, "[i", function()
  move.goto_previous_start("@conditional.outer")
end) -- Lùi lại đầu điều kiện trước đó


-- --- Scope (Phạm vi) & Fold ---
map({ "n", "x", "o" }, "]s", function()
  move.goto_next_start("@local.scope")
end) -- Đi tới phạm vi tiếp theo
map({ "n", "x", "o" }, "]z", function()
  move.goto_next_start("@fold")
end) -- Đi tới fold tiếp theo
