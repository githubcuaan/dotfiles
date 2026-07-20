-- Early initialization - register LSP commands immediately
-- This runs before the lazy-loaded server setup, ensuring commands are available

vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    print("Không có LSP client nào được gắn vào buffer này.")
    return
  end
  for _, client in ipairs(clients) do
    print(string.format("Client: %s (ID: %d)", client.name, client.id))
  end
end, {})
