-- neotree filesystem

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,

  config = function()
    -- 1. Keymaps outside setup
    vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem left<CR>", {
      desc = "Neotree: Đóng/Mở filesystem",
      silent = true,
    })
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "Neotree: Xem các Buffer" })

    require("neo-tree").setup({
      close_if_last_window = true,
      default_position = "left",

      -- 2. Mappings inside neotree window
      window = {
        width = 36,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<cr>"] = "open",
          ["<space>"] = "toggle_node",
          ["q"] = "close_window",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["?"] = "show_help",
        },
      },

      -- 3. Components
      default_component_configs = {

        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
        },

        icon = {
          default = "",
          symlink = "",
          bookmark = "󰆤",
          hidden = "󰜌",
          folder_closed = "",
          folder_empty = "",
          folder_empty_open = "",
          folder_open = "",
          use_filtered_colors = true,
        },

        modified = {
          symbol = require("dnhfan.core.utils").sign_icons.change,
        },

        git_status = {
          symbols = {
            unmerged = "",
            added = require("dnhfan.core.utils").sign_icons.add,
            modified = require("dnhfan.core.utils").sign_icons.change,
            deleted = require("dnhfan.core.utils").sign_icons.topdelete,
            renamed = require("dnhfan.core.utils").sign_icons.info,
            untracked = require("dnhfan.core.utils").sign_icons.untracked,
            ignored = require("dnhfan.core.utils").sign_icons.warning,
            unstaged = require("dnhfan.core.utils").sign_icons.change,
            staged = require("dnhfan.core.utils").sign_icons.success,
            conflict = "",
          },
        },
      },

      -- 4. Filesystem
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            "node_modules",
            ".git",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },

      git_status = {
        enable = true,
      },
    })

    if vim.g.colors_name == "nord" then
      -- === PHẦN CUSTOM MÀU NỀN Ở ĐÂY ===
      -- Nord đang dùng là #2E3440, thì mình cho sidebar tối đi chút (#242933)
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#242933" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#242933" }) -- Lúc không focus cũng màu đó luôn
      vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#242933", fg = "#242933" }) -- Xóa mấy dấu ~ ở cuối
    end
  end,
}
