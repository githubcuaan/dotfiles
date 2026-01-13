vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- movement remaps
keymap.set({ "n", "v" }, "E", "$", {
  desc = "Move to end of line",
  silent = true,
})

keymap.set({ "n", "v" }, "B", "^", {
  desc = "Move to head of line",
  silent = true,
})

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader><tab>o", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader><tab>x", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader><tab>n", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader><tab>p", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader><tab>f", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
