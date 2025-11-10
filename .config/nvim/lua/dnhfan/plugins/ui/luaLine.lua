-- lualine: line in the bottom

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lazy_status = require("lazy.status")

    require('lualine').setup({
      options = {
        theme = 'dracula'
      },
    })
  end
}
