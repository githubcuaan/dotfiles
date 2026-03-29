return function()
  local border = require("dnhfan.core.utils").border
  vim.lsp.buf.hover({ border = border })
end
