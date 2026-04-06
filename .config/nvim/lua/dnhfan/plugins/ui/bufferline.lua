return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- hiển thị các tabs đang mở

        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }, -- Khi hover vào sẽ hiện nút đóng (X)
        },

        style_preset = require("bufferline").style_preset.default,
        separator_style = "thin",
        right_mouse_command = "bdelete %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        indicator = {
          icon = "▎", -- vạch đứng bên trái tab đang chọn
          style = "icon",
        },

        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        -- Hiển thị thông tin LSP (lỗi/cảnh báo) ngay trên tab
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or " 󰋼 ")
            s = s .. sym
          end
          return s
        end,

        offsets = {
          {
            filetype = "snacks_layout_box",
            text = "󰙅 Snacks Explorer",
            text_align = "center",
            separator = true,
            -- padding = 1,
          }
        },

        manage_groups = true,
        clear_panel_notifications = true,

        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,

        highlights = {
          offset_text = {
            fg = "#88C0D0",
            bg = "#2E3440",
          },
        },


        custom_filter = function(buf_number)
          -- 1. Lấy filetype của buffer
          local ft = vim.bo[buf_number].filetype

          -- 2. Loại bỏ các buffer không tên (No Name)
          if vim.fn.bufname(buf_number) == "" then
            return false
          end

          -- 3. Loại bỏ các filetype rác hoặc cửa sổ tạm
          local exclude_ft = {
            "qf", "netrw", "NvimTree", "neo-tree", "lazy", "mason",
            "snacks_picker_list", "snacks_explorer", "snacks_input", "alpha"
          }
          if vim.tbl_contains(exclude_ft, ft) then
            return false
          end

          return true
        end,
      },
    })
  end,
}
