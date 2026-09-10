local dap = require("dap")

dap.set_log_level("warn")

-- NOTE: DAP UI is handled by snacks.nvim (dap module enabled in snacks config)
-- No need for nvim-dap-ui

-- Global DAP keymaps
local map = vim.keymap.set
map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Breakpoint Condition" })
map("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
map("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
map("n", "<leader>dg", function() dap.goto_() end, { desc = "Go to Line" })
map("n", "<leader>dj", function() dap.down() end, { desc = "Down" })
map("n", "<leader>dk", function() dap.up() end, { desc = "Up" })
map("n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })
map("n", "<leader>do", function() dap.step_over() end, { desc = "Step Over" })
map("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
map("n", "<leader>dO", function() dap.step_out() end, { desc = "Step Out" })
map("n", "<leader>dp", function() dap.pause() end, { desc = "Pause" })
map("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })
map("n", "<leader>ds", function() dap.session() end, { desc = "Session" })
map("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
map("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })

-- Load language-specific adapters/configs
pcall(require, "dnhfan.plugins.configs.dap.flutter")
