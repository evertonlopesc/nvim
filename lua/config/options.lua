-- Summary Options
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '100,120'
vim.opt.confirm = true
vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fileformat = 'unix'
vim.opt.fileformats = 'unix'
vim.opt.ffs = 'unix,mac,dos'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'
vim.opt.foldlevelstart = 99
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.history = 1000
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.maxmempattern = 5000
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.spell = true
vim.opt.spelllang = 'pt_br,en_us'
vim.opt.swapfile = false
vim.opt.smartcase = true
vim.opt.startofline = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.textwidth = 80, 120
vim.opt.timeoutlen = 500
vim.opt.undodir = os.getenv('HOME' .. '/home/everton/.config/.vim/undodir')
vim.opt.undofile = true
vim.opt.wig = {
  '**/node_module/*',
  '**/coverage/*',
  '**/.git/*',
  '.pyc',
  '.swp',
  '*.o',
  '*.obj',
  '*~',
  '*vim/backups',
  '*sass-cache',
  '*DS_Store',
  'vendor/rails/**',
  'vendor/cache/**',
  '*.gem',
  'log/**',
  'tmp/**',
  '*.png',
  '*.jpg',
  '*.gif',
  '*.swp',
  '*.pyc',
}
