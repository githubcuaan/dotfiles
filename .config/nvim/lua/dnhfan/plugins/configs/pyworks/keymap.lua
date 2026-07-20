---------------------------------------------------------
-- KEYMAPS
-----------------------------------------------------------
vim.keymap.set("n", "<leader>jox", ":MoltenExportOutput<CR>", {
  desc = "Xuất output ra buffer riêng để soi cho sướng", silent = true
})

vim.keymap.set("n", "<leader>joo", ":MoltenEnterOutput<CR>", { desc = "Enter MolenOutput" })

vim.keymap.set("n", "<leader>jos", ":MoltenShowOutput<CR>", {
  desc = "Hiện cửa sổ Output (để chuẩn bị nhảy vào)", silent = true
})

vim.keymap.set("n", "<leader>joy", ":MolenYankOutput")
