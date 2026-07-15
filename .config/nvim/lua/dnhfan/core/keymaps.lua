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

-- scrolling (not move cursor)
keymap.set("n", "<S-j>", "<C-e>", { silent = true })
keymap.set("n", "<S-k>", "<C-y>", { silent = true })

-- buffer mving
keymap.set("n", "<Tab>", ":bnext<CR>", {
  silent = true
})

keymap.set("n", "<S-Tab>", ":bprevious<CR>", {
  silent = true
})
