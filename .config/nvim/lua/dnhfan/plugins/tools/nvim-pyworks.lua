return {
  {
    "jeryldev/pyworks.nvim",
    dependencies = {
      "benlubas/molten-nvim", -- Bộ não chạy code
    },
    lazy = false,
    priority = 100,
    config = function()
      -- Force image.nvim to init before pyworks' ensure_dependencies() can override it
      pcall(require, "image")

      require("pyworks").setup(require("dnhfan.plugins.configs.pyworks.setup"))

      require("dnhfan.plugins.configs.pyworks.keymap")

      require("dnhfan.plugins.configs.pyworks.molten")
    end,
  },
}
