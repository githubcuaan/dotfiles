local H = require("dnhfan.configs.textobject.helpers")
local select = H.select
local map = H.map

-- ========================================================================
-- 2. SELECT TEXTOBJECTS (Chọn vùng) - Mode: x (visual), o (operator pending)
-- ========================================================================

-- Assignment (Phép gán: =)
map({ "x", "o" }, "a=", function() select.select_textobject("@assignment.outer", "textobjects") end,
  "[Text Object]: Select outer assignment")
map({ "x", "o" }, "i=", function() select.select_textobject("@assignment.inner", "textobjects") end,
  "[Text Object]: Select inner assignment")
map({ "x", "o" }, "l=", function() select.select_textobject("@assignment.lhs", "textobjects") end,
  "[Text Object]: Select LHS assignment")
map({ "x", "o" }, "r=", function() select.select_textobject("@assignment.rhs", "textobjects") end,
  "[Text Object]: Select RHS assignment")

-- Property (Object key-value: :)
map({ "x", "o" }, "a:", function() select.select_textobject("@property.outer", "textobjects") end,
  "[Text Object]: Select outer property")
map({ "x", "o" }, "i:", function() select.select_textobject("@property.inner", "textobjects") end,
  "[Text Object]: Select inner property")
map({ "x", "o" }, "l:", function() select.select_textobject("@property.lhs", "textobjects") end,
  "[Text Object]: Select LHS property")
map({ "x", "o" }, "r:", function() select.select_textobject("@property.rhs", "textobjects") end,
  "[Text Object]: Select RHS property")

-- Parameter / Argument (aa, ia)
map({ "x", "o" }, "aa", function() select.select_textobject("@parameter.outer", "textobjects") end,
  "[Text Object]: Select outer argument")
map({ "x", "o" }, "ia", function() select.select_textobject("@parameter.inner", "textobjects") end,
  "[Text Object]: Select inner argument")

-- Conditional (ai, ii)
map({ "x", "o" }, "ai", function() select.select_textobject("@conditional.outer", "textobjects") end,
  "[Text Object]: Select outer conditional")
map({ "x", "o" }, "ii", function() select.select_textobject("@conditional.inner", "textobjects") end,
  "[Text Object]: Select inner conditional")

-- Loop (al, il)
map({ "x", "o" }, "al", function() select.select_textobject("@loop.outer", "textobjects") end,
  "[Text Object]: Select outer loop")
map({ "x", "o" }, "il", function() select.select_textobject("@loop.inner", "textobjects") end,
  "[Text Object]: Select inner loop")

-- Function Call (af, if)
map({ "x", "o" }, "af", function() select.select_textobject("@call.outer", "textobjects") end,
  "[Text Object]: Select outer function call")
map({ "x", "o" }, "if", function() select.select_textobject("@call.inner", "textobjects") end,
  "[Text Object]: Select inner function call")

-- Function Definition (am, im)
map({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end,
  "[Text Object]: Select outer function def")
map({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end,
  "[Text Object]: Select inner function def")

-- Class (ac, ic)
map({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end,
  "[Text Object]: Select outer class")
map({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end,
  "[Text Object]: Select inner class")
