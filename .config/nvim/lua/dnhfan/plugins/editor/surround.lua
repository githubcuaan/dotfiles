-- Surround: for adding surr

return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function(_, opts)
    require("nvim-surround").setup(opts)
    vim.g.nvim_surround_no_normal_mappings = true

    vim.keymap.set("n", "Za", "<Plug>(nvim-surround-normal)", {
      desc = "Add a surrounding pair around a motion (normal mode)",
    })
    vim.keymap.set("n", "Zd", "<Plug>(nvim-surround-delete)", {
      desc = "Delete a surrounding pair",
    })
    vim.keymap.set("n", "Zr", "<Plug>(nvim-surround-change)", {
      desc = "Change a surrounding pair",
    })
  end,
  opts = {
  },
}
