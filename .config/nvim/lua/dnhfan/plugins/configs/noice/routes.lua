return {
  filter = {
    event = "lsp",
    kind = "progress",
    cond = function(message)
      local client = vim.tbl_get(message.opts, "progress", "client")
      return client == "lua_ls"
    end,
  },
  opts = { skip = true },
}
