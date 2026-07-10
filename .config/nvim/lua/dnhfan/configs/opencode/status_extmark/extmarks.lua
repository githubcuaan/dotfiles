local state = require("dnhfan.configs.opencode.status_extmark.state")

local M = {}

--- Clear all extmarks for the current tracked range.
function M.clear()
  local s = state.data
  if s.bufnr and vim.api.nvim_buf_is_valid(s.bufnr) then
    if s.extmarks.above then
      pcall(vim.api.nvim_buf_del_extmark, s.bufnr, state.NS, s.extmarks.above)
    end
    if s.extmarks.below then
      pcall(vim.api.nvim_buf_del_extmark, s.bufnr, state.NS, s.extmarks.below)
    end
  end
  s.extmarks = {}
end

--- Place extmarks around the tracked code range.
---@param above_text? string
---@param below_text? string
---@param above_hl? string
---@param below_hl? string
function M.place(above_text, below_text, above_hl, below_hl)
  local s = state.data

  if not s.bufnr or not s.first_line or not s.last_line then
    return
  end
  if not vim.api.nvim_buf_is_valid(s.bufnr) then
    return
  end

  M.clear()

  -- Above: virt_lines (2 virtual lines above first_line)
  if above_text and above_hl then
    s.extmarks.above = vim.api.nvim_buf_set_extmark(s.bufnr, state.NS, s.first_line - 1, 0, {
      virt_lines = {
        { { "  " .. above_text, above_hl } },
      },
      virt_lines_above = true,
    })
  end

  -- Below: virt_lines (virtual line below last_line)
  if below_text and below_hl then
    s.extmarks.below = vim.api.nvim_buf_set_extmark(s.bufnr, state.NS, s.last_line - 1, 0, {
      virt_lines = {
        { { "  " .. below_text, below_hl } },
      },
    })
  end
end

return M
