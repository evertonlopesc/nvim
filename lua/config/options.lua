-- Summary Options
vim.opt.breakindent = true                    -- Every wrapped line will continue visually indented
vim.opt.clipboard = 'unnamed'                 -- Copy and Past from registers. Register '*'
vim.opt.clipboard:append ({ 'unnamedplus' })  -- Copy and Past from registers. Register '+'
vim.opt.cmdheight = 0                         -- Number of screen lines to use for the command-line
vim.opt.confirm = true                        -- Not exit, when unsave change
vim.opt.colorcolumn = '120'                   -- List of screen columns that are highlighted
vim.opt.cursorline = true                     -- Highlight the text line of the cursor with CursorLine
vim.opt.expandtab = true                      -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>
vim.opt.foldlevelstart = 99                   -- Starting to edit another buffer in a window
vim.opt.ignorecase = true                     -- Ignore case in search patterns
vim.opt.laststatus = 3                        -- Change to statusline for options
vim.opt.mouse = 'a'                           -- Enables mouse support.
vim.opt.number = true                         -- Line number in front of each line
vim.opt.relativenumber = true                 -- Line number relative to the line with the cursor in front of each line
vim.opt.shiftwidth = 2                        -- Number of spaces to use for each step of (auto)indent
vim.opt.sidescrolloff = 5                     -- The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set
vim.opt.signcolumn = 'yes'                    -- When and how to draw the signcolumn
vim.opt.smartindent = true                    -- Do smart autoindenting when starting a new line
vim.opt.spell = true                          -- Spell checking will be done
vim.opt.spelllang = { 'pt', 'en_us' }         -- A comma-separated list of word list names
vim.opt.splitbelow = true                     -- Put the new window below the currentone
vim.opt.splitright = true                     -- put the new window right of the current
vim.opt.swapfile = false                      -- Use a swapfile for the buffer
vim.opt.startofline = true                    -- Move the cursor to the first non-blank of the line
vim.opt.tabstop = 2                           -- Number of spaces that a <Tab> in the file counts for
vim.opt.termguicolors = true                  -- Enables 24-bit RGB color in the TUI
vim.opt.textwidth = 120                       -- Maximum width of text that is being inserted
vim.opt.timeoutlen = 500                      -- Time in milliseconds to wait for a mapped sequence to complete
vim.opt.undofile = true                       -- Restores undo history from the same file on buffer read
vim.opt.wrap = false                          -- Lines longer than the width of the window will wrap
vim.opt.wig = {                               -- Is ignored when expanding |wildcards
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
