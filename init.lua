require("plugins")
require("lsp.progress_update")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options summary
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.encoding = "UTF-8"
vim.opt.expandtab = true
vim.opt.foldlevelstart = 99
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.history = 1000
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.maxmempattern = 5000
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.syntax = "enable"
vim.opt.smartcase = true
vim.opt.startofline = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.winbar = "%f %m%r%h"
vim.opt.wig = { "**/node_module/*", "**/coverage/*", "**/.git/*", ".pyc", ".swp" }
