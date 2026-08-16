local M = {}

function M.open()
  Snacks.terminal({ "but", "tui", "--remember-selection" }, { win = { border = "rounded", title = "GitButler" } })
end

return M
