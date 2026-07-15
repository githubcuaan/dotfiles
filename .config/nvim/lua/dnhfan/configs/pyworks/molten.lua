---------------------------------------------------------
-- MOLTEN CONFIG
-----------------------------------------------------------
vim.g.molten_virt_text_output_max_height = 30

-- ensure_dependencies() in dependencies.lua ALWAYS calls img.setup() with limited
-- settings because its check() uses img.state (private local => always nil).
-- Re-apply user's opts from nvim-image.lua after pyworks' deferred override runs.
vim.defer_fn(function()
  pcall(function()
    local lazy = require("lazy.core.config")
    local plugin = lazy.plugins["image.nvim"]
    if plugin and plugin.opts then
      require("image").setup(plugin.opts)
    end
  end)
end, 200)
