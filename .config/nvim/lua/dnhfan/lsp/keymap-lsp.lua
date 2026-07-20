local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    -- 1. TÌM KIẾM (Thay thế Telescope) ==============================

    opts.desc = "LSP: Hiển thị định nghĩa kiểu (Type Def)"
    keymap.set("n", "gt", function() Snacks.picker.lsp_type_definitions() end, opts)

    -- 2. CÁC HÀNH ĐỘNG CƠ BẢN (Giữ nguyên hoặc tối ưu) ================

    opts.desc = "LSP: Xem hành động code (Code Action)"
    -- Lưu ý: Nếu bro đã bật `ui_select = true` trong config Snacks picker,
    -- thì lệnh này sẽ TỰ ĐỘNG hiện giao diện đẹp của Snacks. Không cần đổi code.
    keymap.set({ "n", "v" }, "<leader>xa", vim.lsp.buf.code_action, opts)

    opts.desc = "LSP: Đổi tên thông minh"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "LSP: Chẩn đoán dòng (Line Diagnostics)"
    keymap.set("n", "<leader>xx", vim.diagnostic.open_float, opts)

    opts.desc = "LSP: Chẩn đoán trước/sau"
    keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

    opts.desc = "LSP: Hover (Xem docs)"
    keymap.set("n", "M", function() require("dnhfan.scripts.hover")() end, opts)

    opts.desc = "LSP: Restart"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
  end,
})

vim.keymap.set("n", "<leader>th", function()
  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
  end
end, { desc = "LSP: Toggle Inlay Hints" })

if vim.lsp.inlay_hint then
  -- Bật Inlay Hint cho buffer hiện tại khi LSP kết nối thành công
  vim.lsp.inlay_hint.enable(false, { bufnr = 0 })
end
