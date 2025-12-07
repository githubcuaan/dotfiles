-- nvim-treesitter: make a CST (concrete sytax tree)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.embedded_template = {
        install_info = {
          url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
          files = { "src/parser.c" },
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "ejs",
      }
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

      vim.filetype.add({ extension = { ejs = "ejs" } })
      vim.treesitter.language.register("embedded_template", "ejs")
      vim.treesitter.language.register("html", "ejs")
      -- vim.treesitter.language.register("javascript", "ejs")
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
