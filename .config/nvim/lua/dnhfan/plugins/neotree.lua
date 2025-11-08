-- neotree filesystem

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },

  config = function()
    -- 1. Keymaps
    vim.keymap.set("n", "<leader>ee", ":Neotree toggle filesystem left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

    -- 2 config
    require("neo-tree").setup({
      close_if_last_window = true,

      -- === VỊ TRÍ & KÍCH THƯỚC ===
      -- Đặt vị trí mặc định.
      -- Keymap của bạn dùng 'left', nên chúng ta đặt mặc định là 'left'
      default_position = "left",
      window = {
        width = 36, -- Chiều rộng 40-character
        mappings = {
          -- Các phím tắt NỘI BỘ (chỉ dùng khi ở trong neo-tree)
          ["l"] = "open", -- 'l' để mở file/folder
          ["h"] = "close_node", -- 'h' để đóng folder
          ["<cr>"] = "open", -- Enter cũng để mở
          ["<space>"] = "toggle_node", -- Space để expand/collapse
          ["q"] = "close_window", -- 'q' để đóng cửa sổ neo-tree

          -- Các hành động quản lý file
          ["a"] = "add", -- 'a' để thêm file/thư mục
          ["d"] = "delete",
          ["r"] = "rename",
          ["?"] = "show_help", -- '?' để xem trợ giúp
        },
      },

      -- === CẤU HÌNH FILE SYSTEM ===
      filesystem = {
        -- Tự động focus vào file đang mở khi bạn chuyển buffer
        follow_current_file = {
          enabled = true,
        },
        -- Lọc các file/thư mục không mong muốn
        filtered_items = {
          -- Hiển thị các file/thư mục ẩn (bắt đầu bằng dấu .)
          -- Rất quan trọng cho web dev để thấy .env, .gitignore, v.v.
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true, -- Ẩn các file trong .gitignore
          hide_by_name = {
            "node_modules",
            ".git",
          },
          never_show = { -- Luôn luôn ẩn
            ".DS_Store",
            "thumbs.db",
          },
        },
      },

      -- === GIAO DIỆN (UI) ===
      renderers = {
        indent_markers = {
          enable = true, -- Bật các đường kẻ lề
        },
      },
      -- Bật tích hợp Git (hiển thị file đã M(odified), A(dded), D(eleted))
      git_status = {
        enable = true,
      },
    })
  end,
}
