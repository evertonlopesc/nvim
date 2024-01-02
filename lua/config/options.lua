-- Summary Options
local opt = vim.opt
local o = vim.o

-- [[ Context ]]
opt.colorcolumn = '100,120,140' -- str: Show col for max line length
opt.number = true           -- bool: Show line numbers
opt.relativenumber = true   -- bool: Show relative line numbers
opt.scrolloff = 4           -- int: Min num lines of context
opt.signcolumn = 'yes'      -- str: Show the sign column
opt.sidescrolloff = 4       -- num: Min num cloumn of context

-- [[ Filetypes ]]
opt.encoding = 'utf-8'      -- str: String encoding to use
opt.fileencoding = 'utf-8'  -- str: File encoding to use

-- [[ Theme ]]
opt.syntax = 'on'           -- str: Allow syntax highlighting
opt.termguicolors = true    -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true       -- bool: Ignore case in search patterns
opt.smartcase = true        -- bool: Override ignorecase if search contains capitals
opt.incsearch = true        -- bool: Use incremental search
opt.hlsearch = false        -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true        -- bool: Use spaces instead of tabs
opt.shiftwidth = 2          -- num: Size of an indent
opt.softtabstop = 2         -- num: Number of spaces tabs count for in insert mode
opt.tabstop = 2             -- num: Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true       -- bool: Place new window to right of current one
opt.splitbelow = true       -- bool: Place new window below the current one

-- [[ Folder ]]
o.foldcolumn = '1'          -- str: To display a fixed number of columns
o.foldlevel = 99            -- num: Use to folds with a higher level will be open
o.foldlevelstart = 99       -- num: Use to folds open when starting to edit a windows
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldcolumn = '1'

-- [[ Indent ]]
opt.breakindent = true      -- bool: Use to preserving horizontal blocks of text
opt.smartindent = true      -- bool: Autoindenting when starting a new line

-- [[ Windows ]]
opt.clipboard = 'unnamed,unnamedplus'           -- str: Register "*" for all yank, delete, change and put operations
opt.cmdheight = 1                   -- num: Number of screen lines to use for the command-line
opt.confirm = true                  -- bool: Use when close buffer without save changes
opt.cursorline = true               -- bool: Show current line the cursor.
opt.laststatus = 3                  -- num: Show always and ONLY the last window
opt.mouse = 'a'                     -- str: Enable mouse support
opt.spell = true                    -- bool: Enable spell check
opt.spelllang = { 'pt', 'en_us' }   -- str: Identify which lang is checked
opt.swapfile = false                -- bool: Disable save file change in swap
opt.timeoutlen = 500                -- num: Wait 500 milliseconds for any key
opt.startofline = true              -- bool: Move the cursor to the first non-blank of the line
opt.wildignore = {
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
}                                 -- str: A list of file patterns
