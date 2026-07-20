return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  init = function()
    -- Tắt map mặc định để tránh xung đột
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require("dnhfan.plugins.configs.textobject.setup")
    require("dnhfan.plugins.configs.textobject.select")
    require("dnhfan.plugins.configs.textobject.swap")
    require("dnhfan.plugins.configs.textobject.move")
    require("dnhfan.plugins.configs.textobject.repeat")
  end,
}
