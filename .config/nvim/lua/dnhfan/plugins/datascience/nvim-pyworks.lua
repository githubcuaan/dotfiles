return {
  {
    "jeryldev/pyworks.nvim",
    dependencies = {
      "benlubas/molten-nvim", -- Bộ não chạy code
      "3rd/image.nvim",       -- Đôi mắt hiển thị ảnh
    },
    lazy = false,
    priority = 100,
    config = function()
      require("pyworks").setup({
        -- 1. Cấu hình Python & venv (Trái tim dự án)
        python = {
          use_uv = true, -- Dùng uv cho nó "vít" tốc độ
          preferred_venv_name = ".venv",
          auto_install_essentials = true,
          essentials = {
            "pynvim", "ipykernel", "jupyter_client",
            "jupytext", "numpy", "pandas", "matplotlib"
          },
        },

        -- 2. Tự động nhận diện thư viện nội bộ (Tránh báo lỗi ảo)
        packages = {
          custom_package_prefixes = {
            "^my_", "^custom_", "^local_", "^internal_", "^private_",
            "^app_", "^lib_", "^src$", "^utils$", "^helpers$", "algorithm"
          },
        },

        -- 3. Thông báo (Trợ lý thông minh)
        notifications = {
          verbose_first_time = true, -- Giải thích kỹ lần đầu chạy
          silent_when_ready = true,  -- Xong xuôi thì im lặng cho bạn code
          show_progress = true,      -- Hiện thanh loading khi cài thư viện
        },

        -- 4. Tự động hóa
        auto_detect = false,     -- Mở file lên là tự "vào việc" luôn
        image_backend = "kitty", -- Cực chuẩn nếu bạn dùng terminal Kitty

        -- 5. Giữ nguyên mặc định để pyworks tự lo các plugin đi kèm
        skip_molten = false,
        skip_jupytext = false,
        skip_image = false,
        skip_keymaps = false,
      })
      ---------------------------------------------------------
      -- KEYMAPS
      -----------------------------------------------------------
      vim.keymap.set("n", "<leader>jox", ":MoltenExportOutput<CR>", {
        desc = "Xuất output ra buffer riêng để soi cho sướng", silent = true
      })

      vim.keymap.set("n", "<leader>joo", ":MoltenEnterOutput<CR>", { desc = "Enter MolenOutput" })

      vim.g.molten_virt_text_output_max_height = 25
    end,
  },
}
