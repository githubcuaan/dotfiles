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
    -- Keymaps
    vim.keymap.set(
      "n",
      "<leader>e",
      ":Neotree toggle filesystem left<CR>",
      { desc = "Neotree: Đóng/Mở filesystem" }
    )
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "Neotree: Xem các Buffer" })

    require("neo-tree").setup({
      close_if_last_window = true,
      default_position = "left",

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
            deleted = require("dnhfan.core.utils").sign_icons.delete,
            renamed = require("dnhfan.core.utils").sign_icons.info,
            untracked = require("dnhfan.core.utils").sign_icons.untracked,
            ignored = require("dnhfan.core.utils").sign_icons.warning,
            unstaged = require("dnhfan.core.utils").sign_icons.change,
            staged = require("dnhfan.core.utils").sign_icons.success,
            conflict = "",
          },
        },
      },

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
  end,
}
