-- nvim-treesitter: make a CST (concrete sytax tree)
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- QUAN TRỌNG: Không được dùng lazy-loading
  build = ":TSUpdate",
  dependencies = {
    { "jwalton512/vim-blade", ft = "blade" },
  },
  config = function()
    local nvim_ts = require("nvim-treesitter")

    --  1. Setup mặc định (cần thiết để plugin hoạt động)
    nvim_ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    --  2. Tự động cài đặt danh sách parser
    nvim_ts.install(require("dnhfan.core.utils").treesitter_parsers)

    -- Register bash cho zsh
    vim.treesitter.language.register("bash", "zsh")

    --  3. Bật Highlighting (Native)
    vim.api.nvim_create_autocmd("FileType", {
      -- Dùng pattern = "*" để nó tự nhận diện mọi file có parser cho nhàn
      pattern = "*",
      callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang then
          pcall(vim.treesitter.start)
        end
      end,
    })

    --  4. Bật Indentation (API mới)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "javascript", "php", "typescript", "json" }, -- Liệt kê list cần thiết
      callback = function()
        -- Không dùng cho blade vì đại ca đã disable từ trước
        if vim.bo.filetype ~= "blade" then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
