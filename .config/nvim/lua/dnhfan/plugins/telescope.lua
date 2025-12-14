-- nvim-telescope: make a fuzzy search (nâng cấp)
return {
  -- Extension giúp chọn UI đẹp
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  -- Plugin chính của Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- tăng tốc
      "nvim-tree/nvim-web-devicons", -- icon đẹp
      "folke/todo-comments.nvim", -- tìm TODO
      "folke/trouble.nvim", -- quản lý lỗi, quickfix
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local trouble = require("trouble")
      local trouble_telescope = require("trouble.sources.telescope")

      telescope.setup({
        pickers = {
          find_files = {
            hidden = true, -- hiển thị file ẩn
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
          live_grep = {
            additional_args = function()
              return { "--hidden", "--glob", "!**/.git/*" }
            end,
          },
        },

        defaults = {
          path_display = { "smart" },
          file_ignore_patterns = { "^.git/" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-t>"] = trouble_telescope.open, -- mở trong Trouble
            },
            n = {
              ["<C-t>"] = trouble_telescope.open,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {
            fuzzy = true, -- bật tìm kiếm mờ
            override_generic_sorter = true, -- thay sorter mặc định
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      -- Nạp extension
      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")

      -- Keymap
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Tìm file" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Tìm chuỗi trong project" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Telescope: Mở file gần đây" })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Telescope: Tìm TODO trong code" })
      vim.keymap.set(
        "n",
        "<leader>fc",
        "<cmd>Telescope grep_string<cr>",
        { desc = "Telescope: Tìm chuỗi ở cursor trong cwd" }
      )
      vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Telescope: Tìm keymap" })
    end,
  },
}
