return function()
  require('dnhfan.configs.mini-files.border')()

  require('mini.files').setup({
    content = {
      filter = nil,
      highlight = nil,
      prefix = nil,
      sort = nil,
    },
    mappings = {
      close       = 'q',
      go_in       = 'L',
      go_in_plus  = 'n',
      go_out      = 'H',
      go_out_plus = 'p',
      mark_goto   = "'",
      mark_set    = 'm',
      reset       = '<BS>',
      reveal_cwd  = '@',
      show_help   = 'g?',
      synchronize = '<CR>',
      trim_left   = '<',
      trim_right  = '>',
    },
    options = {
      permanent_delete = true,
      use_as_default_explorer = true,
      lsp_timeout = 1000,
    },
    windows = {
      max_number = math.huge,
      preview = false,
      width_focus = 50,
      width_nofocus = 15,
      width_preview = 25,
    },
  })

  require('dnhfan.configs.mini-files.keymap')()
end
