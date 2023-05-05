-- Summary Options

vim.opt.breakindent = true
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.cmdheight = 1
vim.opt.confirm = true
vim.opt.colorcolumn = '80,120'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldlevelstart = 99
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.spell = true
vim.opt.spelllang = { 'pt', 'en_us' }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.startofline = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.wig = {
  '**/node_module/*',
  '**/coverage/*',
  '**/.git/*',
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
