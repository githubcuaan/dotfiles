return function(buf_number)
  -- 1. Lấy filetype của buffer
  local ft = vim.bo[buf_number].filetype

  -- 2. Loại bỏ các buffer không tên (No Name)
  if vim.fn.bufname(buf_number) == "" then
    return false
  end

  -- 3. Loại bỏ các filetype rác hoặc cửa sổ tạm
  local exclude_ft = {
    "qf", "netrw", "NvimTree", "neo-tree", "lazy", "mason",
    "snacks_picker_list", "snacks_explorer", "snacks_input", "alpha"
  }
  if vim.tbl_contains(exclude_ft, ft) then
    return false
  end

  return true
end
