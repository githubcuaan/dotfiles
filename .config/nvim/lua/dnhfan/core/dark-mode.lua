local M = {}

local function parse_theme(output)
  if not output then return "light" end
  local clean = output:gsub("^%s+", ""):gsub("%s+$", ""):gsub("'", "")
  if clean:match("prefer%-dark") then
    return "dark"
  end
  return "light"
end

function M.setup()
  -- 1. Lấy theme ban đầu bằng sync process (không dùng io.popen chặn main thread)
  local init_res = vim.system({ "gsettings", "get", "org.gnome.desktop.interface", "color-scheme" }, { text = true })
      :wait()
  if init_res.code == 0 then
    vim.o.background = parse_theme(init_res.stdout)
  end

  -- 2. Tạo async process để monitor thay đổi qua DBus
  local uv = vim.uv
  local stdout = uv.new_pipe(false)

  local handle
  handle, _ = uv.spawn("gsettings", {
    args = { "monitor", "org.gnome.desktop.interface", "color-scheme" },
    stdio = { nil, stdout, nil }
  }, function(_, _)
    if handle and not handle:is_closing() then handle:close() end
  end)

  if not handle then return end

  -- 3. Đọc luồng thay đổi
  stdout:read_start(vim.schedule_wrap(function(err, data)
    if err or not data then
      if not stdout:is_closing() then stdout:close() end
      return
    end

    -- gsettings monitor trả về chuỗi có dạng: color-scheme: 'prefer-dark'
    local val = data:match("color%-scheme:%s*(.*)")
    if val then
      vim.o.background = parse_theme(val)
    end
  end))

  -- 4. Dọn dẹp tài nguyên khi thoát
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      if stdout and not stdout:is_closing() then stdout:close() end
      if handle and not handle:is_closing() then handle:close() end
    end,
  })
end

return M
