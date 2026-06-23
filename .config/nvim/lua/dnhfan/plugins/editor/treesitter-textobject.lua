return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  init = function()
    -- Tắt map mặc định để tránh xung đột
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require("dnhfan.configs.textobject.setup")
    require("dnhfan.configs.textobject.select")
    require("dnhfan.configs.textobject.swap")
    require("dnhfan.configs.textobject.move")
    require("dnhfan.configs.textobject.repeat")
  end,
}
