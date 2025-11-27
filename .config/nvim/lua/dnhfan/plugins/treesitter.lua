-- nvim-treesitter: make a CST (concrete sytax tree)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = {
          enable = true,
          disable = { "blade" },
        },
        -- ensure these language parsers are installed
        ensure_installed = require("dnhfan.core.utils").treesitter_parsers,

        auto_install = true,
        ignore_install = {},
        modules = {},
        sync_install = false,

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      -- use bash parser for zsh files
      vim.treesitter.language.register("bash", "zsh")
    end,

    opts = function(_, opts)
      if type(opts.ensure_installed) == table then
        vim.list_extend(opts.ensure_installed, { "blade", "php_only" })
      end
    end,
  },

  {
    "jwalton512/vim-blade",
    ft = "blade", -- Chỉ load khi mở file blade
  },
}
