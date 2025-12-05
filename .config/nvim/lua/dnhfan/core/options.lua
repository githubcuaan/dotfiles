vim.cmd("let g:netrw_liststyle = 3")

-- Enable built-in EditorConfig support
vim.g.editorconfig = true

vim.o.autoread = true -- automatically read file when changed outside of nvim

local opt = vim.opt

-- Code folding using treesitter
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Bật chế độ xuống dòng mềm (chỉ hiển thị xuống dòng, không thêm ký tự enter thật)
opt.wrap = true

-- Ngắt dòng theo từ (để không bị chặt đôi chữ cái khi xuống dòng)
opt.linebreak = true

-- Giữ thụt đầu dòng cho đẹp (nhìn code đỡ rối mắt)
opt.breakindent = true

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- File-type specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "blade" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
