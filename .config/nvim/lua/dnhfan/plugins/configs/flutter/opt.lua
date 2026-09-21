return {
  -- NOTE: Flutter SDK paths (set to nil to use PATH)
  flutter_path = "/home/andev/tools/flutter/bin/flutter",
  dart_path = "/home/andev/tools/flutter/bin/dart",

  ui = {
    border = require("dnhfan.core.utils").border,
    notification_style = "plugin",
  },

  -- Dart Analysis Server (managed by flutter-tools, NOT mason-lspconfig)
  lsp = {
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("$HOME/fvm"),
      },
      renameFilesWithClasses = "prompt",
      enableSnippets = true,
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  },

  widget_guides = {
    enabled = true,
  },

  closing_tags = {
    enabled = true,
    highlight = "Comment",
    prefix = "// ",
    priority = 10,
  },

  dev_log = {
    enabled = true,
    open_cmd = "tabedit",
  },

  dev_tools = {
    autostart = false,
    activate = true,
  },

  debugger = {
    enabled = false, -- We use nvim-dap directly via configs/dap/flutter.lua
    exception_breakpoints = {},
    evaluate_to_string_in_debug_views = true,
    register_configurations = function(_)
      require("dnhfan.plugins.configs.dap.flutter")
    end,
  },
}
