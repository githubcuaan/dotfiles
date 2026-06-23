local H = require("dnhfan.configs.textobject.helpers")
local swap = H.swap
local map = H.map

-- ========================================================================
-- 3. SWAP (Hoán đổi vị trí) - Mode: n (normal)
-- ========================================================================

-- Swap Next
map("n", "<leader>na", function() swap.swap_next("@parameter.inner") end, "[Text Object]: Swap next argument")
map("n", "<leader>nm", function() swap.swap_next("@function.outer") end, "[Text Object]: Swap next function")
map("n", "<leader>n:", function() swap.swap_next("@property.outer") end, "[Text Object]: Swap next property")

-- Swap Previous
map("n", "<leader>pa", function() swap.swap_previous("@parameter.inner") end, "[Text Object]: Swap prev argument")
map("n", "<leader>pm", function() swap.swap_previous("@function.outer") end, "[Text Object]: Swap prev function")
map("n", "<leader>p:", function() swap.swap_previous("@property.outer") end, "[Text Object]: Swap prev property")
