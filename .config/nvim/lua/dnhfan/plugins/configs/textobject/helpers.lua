local M = {}

M.select = require("nvim-treesitter-textobjects.select")
M.swap = require("nvim-treesitter-textobjects.swap")
M.move = require("nvim-treesitter-textobjects.move")
M.ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

function M.map(mode, key, func, desc)
  vim.keymap.set(mode, key, func, { desc = desc, silent = true })
end

return M
