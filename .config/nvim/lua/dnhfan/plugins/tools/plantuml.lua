vim.filetype.add({
  extension = {
    puml = "plantuml",
    pu = "plantuml",
    wsd = "plantuml",
    iuml = "plantuml",
    plantuml = "plantuml",
  },
})
vim.g["plantuml_previewer#plantuml_jar_path"] = "/usr/share/java/plantuml/plantuml.jar"

return {
  "weirongxu/plantuml-previewer.vim",
  dependencies = {
    "tyru/open-browser.vim",
    "aklt/plantuml-syntax",
  },
  ft = "plantuml",

  config = function()
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

    if not configs.plantuml_lsp then
      configs.plantuml_lsp = {
        default_config = {
          cmd = {
            "plantuml-lsp",
            "--jar-path=/usr/share/java/plantuml/plantuml.jar",
          },
          filetypes = { "plantuml" },
          root_dir = function(fname)
            -- Cập nhật API mới không bị deprecate
            local git_path = vim.fs.find('.git', { path = fname, upward = true })[1]
            return git_path and vim.fs.dirname(git_path) or vim.fs.dirname(fname)
          end,
          settings = {},
        }
      }
    end

    vim.keymap.set("n", "<leader>pu", ":PlantumlOpen<CR>", { desc = "Mở PlantUML Preview" })
    vim.keymap.set("n", "<leader>ps", ":PlantumlStop<CR>", { desc = "Dừng PlantUML Preview" })
    lspconfig.plantuml_lsp.setup {}
  end
}
