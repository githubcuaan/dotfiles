return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    require("illuminate").configure({
      -- Đây là nơi bạn chép toàn bộ tùy chọn config của mình vào
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 100,
      filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
        "neo-tree", -- Thêm các plugin quản lý file
        "NvimTree",
        "toggleterm",
      },
      under_cursor = true,
      large_file_cutoff = 10000,
      large_file_overrides = nil,
      min_count_to_highlight = 2, -- Nên đổi từ 1 sang 2
      disable_keymaps = false,
      -- ... các tùy chọn khác của bạn
    })
  end,
}
