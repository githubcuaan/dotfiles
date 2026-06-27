-- Recommended/example keymaps
vim.keymap.set({ "n", "x" }, "<leader>ca", function() require("opencode").ask("@this: ") end,
  { desc = " OpenCode: Ask" })
vim.keymap.set({ "n", "x" }, "<leader>cs", function() require("opencode").select() end, { desc = " OpenCode: Select" })

vim.keymap.set({ "n", "x" }, "<leader>cg", function() return require("opencode").operator("@this ") end,
  { desc = " OpenCode: Add range", expr = true })
vim.keymap.set("n", "<leader>cG", function() return require("opencode").operator("@this ") .. "_" end,
  { desc = " OpenCode: Add line", expr = true })

vim.keymap.set("n", "<A-u>", function() require("opencode").command("session.half.page.up") end,
  { desc = " OpenCode: Scroll up" })
vim.keymap.set("n", "<A-d>", function() require("opencode").command("session.half.page.down") end,
  { desc = " OpenCode: Scroll down" })
