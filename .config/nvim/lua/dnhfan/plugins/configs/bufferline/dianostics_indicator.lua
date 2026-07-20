return function(count, level, diagnostics_dict, context)
  local s = ""
  for e in pairs(diagnostics_dict) do
    -- Dời dấu cách lên trước icon, xóa khoảng trắng đằng sau đi
    local sym = e == "error" and " " or (e == "warning" and " " or " 󰋼")
    s = s .. sym
  end
  return s
end
