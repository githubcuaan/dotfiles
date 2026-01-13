return {

  "lewis6991/gitsigns.nvim",

  event = { "BufReadPre", "BufNewFile" },

  opts = {
    preview_config = {
      -- Các loại border: 'single', 'double', 'rounded', 'solid', 'shadow', 'none'
      border = "rounded",

      -- Các tùy chỉnh khác nếu thích
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation

      map("n", "]h", gs.next_hunk, "Next Hunk")

      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions

      map("n", "<leader>ghs", gs.stage_hunk, "Gitsign: Stage hunk")

      map("n", "<leader>ghr", gs.reset_hunk, "Gitsign: Reset hunk")

      map("v", "<leader>ghs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Gitsign: Stage hunk")

      map("v", "<leader>ghr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Gitsign: Reset hunk")

      map("n", "<leader>ghS", gs.stage_buffer, "Gitsign: Stage buffer")

      map("n", "<leader>ghR", gs.reset_buffer, "Gitsign: Reset buffer")

      map("n", "<leader>ghu", gs.undo_stage_hunk, "Gitsign: Undo stage hunk")

      map("n", "<leader>ghp", gs.preview_hunk, "Gitsign: Preview hunk")

      map("n", "<leader>ghb", function()
        gs.blame_line({ full = true })
      end, "Gitsign: Blame line")

      map("n", "<leader>ghB", gs.toggle_current_line_blame, "Gitsign: Toggle line blame")

      map("n", "<leader>ghd", gs.diffthis, "Gitsign: Diff this")

      map("n", "<leader>ghD", function()
        gs.diffthis("~")
      end, "Gitsign: Diff this ~")

      -- Text object
      map({ "o", "x" }, "gih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns: select hunk")
    end,
  },
}
