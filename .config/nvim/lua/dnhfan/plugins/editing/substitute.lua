return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>r", substitute.operator, { desc = "Substitute: Thay thế bằng motions" })
    keymap.set("n", "<leader>rr", substitute.line, { desc = "Substitute: Thay thế line" })
    keymap.set("n", "<leader>R", substitute.eol, { desc = "Substitute: Thay thế đến cuối line" })
    keymap.set("x", "<leader>r", substitute.visual, { desc = "Substitute: trong visual mode" })
  end,
}
