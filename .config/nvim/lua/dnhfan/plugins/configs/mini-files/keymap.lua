return function()
  vim.keymap.set('n', '<leader>e', function()
    local mf = require('mini.files')
    if not mf.close() then
      mf.open(vim.api.nvim_buf_get_name(0))
    end
  end, { desc = "Toggle mini.files" })

  vim.keymap.set('n', '<leader>E', function()
    require('mini.files').open(vim.uv.cwd())
  end, { desc = "Open mini.files (cwd)" })
end
