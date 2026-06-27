-- Recommended/example keymaps
vim.keymap.set({ "n", "x" }, "<leader>ca", function() require("opencode").ask("@this: ") end,
  { desc = "Ask OpenCode…" })
vim.keymap.set({ "n", "x" }, "<leader>cs", function() require("opencode").select() end, { desc = "Select OpenCode…" })

vim.keymap.set({ "n", "x" }, "<leader>cg", function() return require("opencode").operator("@this ") end,
  { desc = "Add range to opencode", expr = true })
vim.keymap.set("n", "<leader>cG", function() return require("opencode").operator("@this ") .. "_" end,
  { desc = "Add line to opencode", expr = true })

vim.keymap.set("n", "<A-u>", function() require("opencode").command("session.half.page.up") end,
  { desc = "Scroll opencode up" })
vim.keymap.set("n", "<A-d>", function() require("opencode").command("session.half.page.down") end,
  { desc = "Scroll opencode down" })
