-- Auto tag for ts

return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter", -- Chỉ load khi bạn bắt đầu gõ (tiết kiệm startuptime)
  opts = {
    -- Các tùy chọn cấu hình (mặc định đã rất tốt)
    opts = {
      enable_close = true,          -- Tự động đóng thẻ: gõ <div> tự sinh </div>
      enable_rename = true,         -- Tự động đổi tên: sửa <div> thành <p> thì thẻ đóng cũng đổi theo
      enable_close_on_slash = true, -- Gõ </ sẽ tự động đóng thẻ gần nhất
    },
  },
}
