vim.filetype.add({
  extension = {
    puml = "plantuml",
    pu = "plantuml",
    wsd = "plantuml",
    iuml = "plantuml",
    plantuml = "plantuml",
  },
})

return {
  "weirongxu/plantuml-previewer.vim",
  dependencies = {
    "tyru/open-browser.vim",
    "aklt/plantuml-syntax",
  },
  ft = "plantuml",
  config = function()
    -- Đặt phím tắt để mở preview nhanh chóng (tùy chọn)
    vim.keymap.set("n", "<leader>pu", ":PlantumlOpen<CR>", { desc = "Mở PlantUML Preview" })
    vim.keymap.set("n", "<leader>ps", ":PlantumlStop<CR>", { desc = "Dừng PlantUML Preview" })
  end,
}
