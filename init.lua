require ("plugins")
require ("mappings")

-- Options summary
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.history = 5000
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.maxmempattern = 5000
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.syntax = "enable"
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300

vim.opt.wig = {
  '**/node_module/*',
  '**/coverage/*',
  '**/.git/*'
}
