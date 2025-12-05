return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- 1. Setup Linter
    lint.linters_by_ft = {
      python = {},
      -- javascript = { "eslint_d" }, -- Ví dụ nếu sau này dùng thêm
    }

    -- 2. Setup Auto Command (Tự động Lint)
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- Gọi hàm này không cần tham số, nó tự check filetype và linter tương ứng
        lint.try_lint()
      end,
    })

    -- 3. Keymap thủ công (Cho chắc cốp)
    vim.keymap.set("n", "<leader>lt", function()
      lint.try_lint()
    end, { desc = "Linting: Trigger linting cho file hiện tại." })
  end,
}
