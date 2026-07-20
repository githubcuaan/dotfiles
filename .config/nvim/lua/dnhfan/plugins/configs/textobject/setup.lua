-- Tắt map mặc định để tránh xung đột, vì mình sẽ tự map thủ công bên dưới
vim.g.no_plugin_maps = true

-- 1. Setup options cơ bản (Option cho behavior)
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V',  -- linewise
      -- ['@class.outer'] = '<c-v>', -- blockwise
    },
    include_surrounding_whitespace = false,
  },
  move = {
    -- whether to set jumps in the jumplist
    set_jumps = true,
  },
})
