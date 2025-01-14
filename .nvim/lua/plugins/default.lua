vim.g.mapleader = ","

vim.opt.encoding="utf-8"

vim.opt.relativenumber = false
vim.opt.compatible=false
vim.opt.hlsearch=true
vim.opt.laststatus = 2
vim.opt.vb = true
vim.opt.ruler = true
vim.opt.spelllang="en_us"
vim.opt.autoindent=true
vim.opt.colorcolumn="120"
vim.opt.textwidth=120
vim.opt.mouse="a"
vim.opt.clipboard="unnamed"
vim.opt.scrollbind=false
vim.opt.wildmenu=true

vim.opt.showcmd=true -- "show incomplete cmds down the bottom
vim.opt.showmode=true -- "show current mode down the bottom
vim.opt.incsearch=true -- "find the next match as we type the search
vim.opt.wrap=false -- "dont wrap lines
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.backup=false
vim.opt.swapfile=false
vim.opt.nu=true
vim.opt.cursorcolumn=true

-- remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", 
  command = ":%s/\\s\\+$//e"
})

