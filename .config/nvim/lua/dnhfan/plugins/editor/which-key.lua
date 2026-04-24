return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "helix",
    defaults = {},

    spec = {
      {
        mode = { "n", "x" },
        { "<leader>c",  group = "code" },
        -- { "<leader>d",     group = "debug" },
        { "<leader>f",  group = "file/find" },
        { "<leader>g",  group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>s",  group = "search" },
        { "<leader>u",  group = "ui" },
        { "<leader>x",  group = "diagnostics/quickfix" },
        { "[",          group = "prev" },
        { "]",          group = "next" },
        { "g",          group = "goto" },
        { "Z",          group = "surround" },
        { "z",          group = "fold" },
        { "<leader>G",  group = "github" },
        { "<leader>m",  group = "formatter" },

        {
          "<leader>b",
          group = "buffer",
          { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
          { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        },

        {
          "<leader>q",
          group = "quit/session",
          { "<leader>qq", "<cmd>qa<cr>", desc = "Quit All", icon = { icon = "󰈆 ", color = "red" } },
          { "<leader>qw", "<cmd>wqa<cr>", desc = "Save and Quit All", icon = { icon = "󰆓 ", color = "green" } },
          { "<leader>q!", "<cmd>qa!<cr>", desc = "Quit Without Saving", icon = { icon = " ", color = "orange" } },
        },

        {
          "<leader>j",
          group = "jupyter",
          icon = { icon = "", color = "orange" },
        },

        {
          "<leader>r",
          group = "substitute",
          icon = ""
        },

        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,

          { "<leader>wd", "<cmd>vertical resize -5<cr>" },
          { "<leader>wi", "<cmd>vertical resize +5<cr>" },
          { "<leader>w=", "<c-w>=" },

        },

        -- better descriptions
        { "gx", desc = "Open with system app" },

        {
          "<leader><tab>",
          group = "tabs",
          icon = "󰓩 ",
          { "<leader><tab>o", "<cmd>tabnew<cr>", desc = "New Tab", icon = "󰝒 " },
          { "<leader><tab>x", "<cmd>tabclose<cr>", desc = "Close Tab", icon = "󰅖 " },
          { "<leader><tab>n", "<cmd>tabnext<cr>", desc = "Next Tab", icon = "󰙡 " },
          { "<leader><tab>p", "<cmd>tabprevious<cr>", desc = "Prev Tab", icon = "󰙣 " },
          { "<leader><tab>f", "<cmd>tabfirst<cr>", desc = "First Tab" },
          { "<leader><tab>l", "<cmd>tablast<cr>", desc = "Last Tab" },
        },
      },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Tự động tạo phím tắt từ 1 đến 9 cho Bufferline
    local buffer_mappings = {}
    for i = 1, 9 do
      table.insert(buffer_mappings, {
        "<leader>b" .. i,
        function() require("bufferline").go_to(i, true) end,
        hidden = true
      })
    end

    -- Tự động tạo phím tắt từ 1 đến 9 cho Tabs
    local tab_mapings = {}
    for i = 1, 9 do
      table.insert(buffer_mappings, {
        "<leader><tab>" .. i,
        function()
          vim.cmd("tabn" .. i)
        end,
        hidden = true
      })
    end

    -- Đăng ký bộ số này với Which-key
    wk.add(buffer_mappings, tab_mapings)
  end
}
