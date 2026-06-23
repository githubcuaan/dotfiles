local H = require("dnhfan.configs.textobject.helpers")
local select = H.select
local map = H.map

-- CONVENTION:
--   MODE:  x=visual  o=operator-pending  n=normal
--   TYPE:  a=outer   i=inner             l=lhs   r=rhs
--   TARGET: =assignment  :=property  a=argument  i=conditional
--           l=loop  f=function-call  m=function-def  c=class

-- ========================================================================
-- 2. SELECT TEXTOBJECTS (Chọn vùng) - Mode: x (visual), o (operator pending)
-- ========================================================================

-- Assignment (Phép gán: =)
map({ "x", "o" }, "a=", function() select.select_textobject("@assignment.outer", "textobjects") end) -- Chọn toàn bộ phép gán
map({ "x", "o" }, "i=", function() select.select_textobject("@assignment.inner", "textobjects") end) -- Chọn phần bên trong phép gán
map({ "x", "o" }, "l=", function() select.select_textobject("@assignment.lhs", "textobjects") end)   -- Chọn vế trái phép gán
map({ "x", "o" }, "r=", function() select.select_textobject("@assignment.rhs", "textobjects") end)   -- Chọn vế phải phép gán

-- Property (Object key-value: :)
map({ "x", "o" }, "a:", function() select.select_textobject("@property.outer", "textobjects") end) -- Chọn toàn bộ property
map({ "x", "o" }, "i:", function() select.select_textobject("@property.inner", "textobjects") end) -- Chọn phần bên trong property
map({ "x", "o" }, "l:", function() select.select_textobject("@property.lhs", "textobjects") end)   -- Chọn vế trái property
map({ "x", "o" }, "r:", function() select.select_textobject("@property.rhs", "textobjects") end)   -- Chọn vế phải property

-- Parameter / Argument (aa, ia)
map({ "x", "o" }, "aa", function() select.select_textobject("@parameter.outer", "textobjects") end) -- Chọn toàn bộ tham số
map({ "x", "o" }, "ia", function() select.select_textobject("@parameter.inner", "textobjects") end) -- Chọn phần bên trong tham số

-- Conditional (ai, ii)
map({ "x", "o" }, "ai", function() select.select_textobject("@conditional.outer", "textobjects") end) -- Chọn toàn bộ khối điều kiện
map({ "x", "o" }, "ii", function() select.select_textobject("@conditional.inner", "textobjects") end) -- Chọn phần bên trong khối điều kiện

-- Loop (al, il)
map({ "x", "o" }, "al", function() select.select_textobject("@loop.outer", "textobjects") end) -- Chọn toàn bộ vòng lặp
map({ "x", "o" }, "il", function() select.select_textobject("@loop.inner", "textobjects") end) -- Chọn phần bên trong vòng lặp

-- Function Call (af, if)
map({ "x", "o" }, "af", function() select.select_textobject("@call.outer", "textobjects") end) -- Chọn toàn bộ lời gọi hàm
map({ "x", "o" }, "if", function() select.select_textobject("@call.inner", "textobjects") end) -- Chọn phần bên trong lời gọi hàm

-- Function Definition (am, im)
map({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end) -- Chọn toàn bộ định nghĩa hàm
map({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end) -- Chọn phần bên trong định nghĩa hàm

-- Class (ac, ic)
map({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end) -- Chọn toàn bộ lớp
map({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end) -- Chọn phần bên trong lớp
