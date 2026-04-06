return function()
  require("bufferline").setup({
    options = {
      mode = "buffers", -- hiển thị các tabs đang mở
      numbers = "ordinal",

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
      diagnostics_indicator = require("dnhfan.configs.bufferline.dianostics_indicator"),
      offsets = require("dnhfan.configs.bufferline.offsets"),

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


      custom_filter = require("dnhfan.configs.bufferline.custom_filter"),
    },
  })
end
