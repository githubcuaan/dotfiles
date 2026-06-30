local function get_opencode_port()
  local cwd = vim.fn.getcwd()
  local hash = vim.fn.system("printf '%s' " .. vim.fn.shellescape(cwd) .. " | md5sum | cut -c1-4"):gsub("%s+", "")
  return tonumber(hash, 16) % 55536 + 10000
end

local function get_opencode_session()
  local cwd = vim.fn.getcwd()
  return "opencode-" ..
      vim.fn.system("printf '%s\\n' " .. vim.fn.shellescape(cwd) .. " | md5sum | cut -c1-8"):gsub("%s+", "")
end

---@type opencode.Opts
vim.g.opencode_opts = {
  server = {
    url = "http://127.0.0.1:" .. get_opencode_port(),
    start = function()
      local session = get_opencode_session()
      vim.fn.system(
        "tmux has-session -t " .. vim.fn.shellescape(session) .. " 2>/dev/null || "
        ..
        "tmux new-session -d -s " ..
        vim.fn.shellescape(session) ..
        " -c " .. vim.fn.shellescape(vim.fn.getcwd()) .. " 'opencode --port " .. get_opencode_port() .. "'"
      )
    end,
  },
}

require("dnhfan.configs.opencode.status_extmark").setup()
