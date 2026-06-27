local function get_opencode_port()
  local cwd = vim.fn.getcwd()
  local hash = vim.fn.system("echo " .. vim.fn.shellescape(cwd) .. " | md5sum | cut -c1-4"):gsub("%s+", "")
  return tonumber(hash, 16) % 55536 + 10000
end

---@type opencode.Opts
vim.g.opencode_opts = {
  server = {
    url = "http://127.0.0.1:" .. get_opencode_port(),
  },
}
