vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = "a"

vim.opt.laststatus = 3

vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.spell = false
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 10
vim.opt.cul = true -- cursor line
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.history = 999
vim.opt.timeoutlen = 400
vim.opt.updatetime = 400
vim.opt.list = true
vim.opt.autoread = true
vim.opt.termguicolors = true
vim.opt.shortmess:append("W")
vim.opt.fillchars:append("eob: ") -- remove end of buffer char (~)
vim.o.completeopt = "menuone,noselect"
vim.o.sessionoptions = "curdir,folds,help,winsize,winpos,localoptions"
