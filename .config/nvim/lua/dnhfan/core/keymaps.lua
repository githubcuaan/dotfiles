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

keymap.set('n', '+', '<C-a>', { desc = "Increase Sequence" })
keymap.set('n', '-', '<C-x>', { desc = "Decrease Sequence" })
