return {
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Dropbar: Pick symbols ở winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Dropbar: Nhảy đến đầu context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Dropbar: Chọn next context" })
    end,
  },
}
