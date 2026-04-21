return {
  default = {
    "lsp",
    "snippets",
    "path",
    "buffer",
    "copilot",
  },
  providers = {
    lsp = { name = "LSP" },
    snippets = { name = "snippets" },
    path = { name = "path" },
    copilot = {
      name = "copilot",
      module = "blink-cmp-copilot",
      score_offset = 100,
      async = true,
    },
    cmdline = {},
    buffer = {
      name = "buffer",
      max_items = 10,
      opts = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  },
}
