local H = require("dnhfan.plugins.configs.textobject.helpers")
local swap = H.swap
local map = H.map

-- CONVENTION:
--   n=next  p=previous
--   a=argument  m=function  :=property

-- ========================================================================
-- 3. SWAP (Hoán đổi vị trí) - Mode: n (normal)
-- ========================================================================

-- Swap Next
map("n", "<leader>na", function() swap.swap_next("@parameter.inner") end) -- Đổi chỗ với tham số tiếp theo
map("n", "<leader>nm", function() swap.swap_next("@function.outer") end) -- Đổi chỗ với hàm tiếp theo
map("n", "<leader>n:", function() swap.swap_next("@property.outer") end) -- Đổi chỗ với property tiếp theo

-- Swap Previous
map("n", "<leader>pa", function() swap.swap_previous("@parameter.inner") end) -- Đổi chỗ với tham số trước đó
map("n", "<leader>pm", function() swap.swap_previous("@function.outer") end) -- Đổi chỗ với hàm trước đó
map("n", "<leader>p:", function() swap.swap_previous("@property.outer") end) -- Đổi chỗ với property trước đó
