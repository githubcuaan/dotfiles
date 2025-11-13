return {
  "nvim-tree/nvim-web-devicons",
  event = "VimEnter",
  config = function()
    require("nvim-web-devicons").setup({
      override = require("dnhfan.core.icons"),
      color_icons = true,
      default = true,
      strict = false,
    })
  end,
}
