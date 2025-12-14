return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- Bắt buộc phải có 2 thằng đệ này mới chạy được nhé
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      -- Ghi đè chức năng hiển thị hover/signature của LSP mặc định
      -- để noice nó render popup đẹp hơn
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = {
        enabled = false, -- Tắt hiển thị signature help của noice (nếu thích)
      },
    },
    presets = {
      bottom_search = true, -- Giữ thanh search (/) ở dưới (nếu thích)
      command_palette = true, -- Biến cmdline (:) thành popup giữa màn hình -> CÁI BÁC CẦN LÀ ĐÂY
      long_message_to_split = true, -- Tin nhắn dài quá thì đẩy vào split window
    },
  },
}
