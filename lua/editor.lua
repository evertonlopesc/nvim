local set = vim.opt -- Enable options set global, window and buffer settings.
local cmd = vim.cmd
local g = vim.g

-- General
set.synmaxcol = 1000
set.syntax = "enable"
set.mmp = 5000
set.clipboard = "unnamedplus"
set.encoding = "UTF-8"
set.number = true
set.relativenumber = true
set.hidden = true
set.laststatus = 2
set.mouse = "a"
set.previewheight = 12
set.scrolloff = 5
set.sidescrolloff = 5
set.timeoutlen = 300

-- Set completeopt to have a better completion experience
set.completeopt = "menu,menuone,noinsert"

-- Avoid showing message extra message when using completion
set.shortmess = "c"

-- Spell language
set.spell = true
set.spelllang = "en"

-- Editor
set.autoindent = true
set.history = 5000
--set.ruler = true
set.textwidth = 120
set.colorcolumn = "120"
set.cursorline = true
set.autoread = true
set.linebreak = true
set.wrap = true

-- Set the behavior of tab
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- Search
set.incsearch = true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true

-- Style
set.termguicolors = true
set.background = "dark"

g.nord_underline_option = 'none'
g.nord_italic = true
g.nord_italic_comments = false
g.nord_minimal_mode = false
g.nord_alternate_backgrounds = false
cmd('colorscheme nordic')
