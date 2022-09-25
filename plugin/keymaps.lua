vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Reload file lua
keymap('n', '<leader>rr', ":source % <CR>", opts)

-- TrailingWhiteSpace
keymap('n', '<F2>', ":%s/\\s*$//<CR>", opts)

-- Resizes
keymap('n', '<Down>', ":resize -5<CR>", opts)
keymap('n', '<Up>', ":resize +5<CR>", opts)
keymap('n', '<Left>', ":vertical resize -5<CR>", opts)
keymap('n', '<Right>', ":vertical resize +5<CR>", opts)

-- move between split
keymap('i', '<A-h>', "<C-\\><C-n><C-w>h", opts)
keymap('i', '<A-j>', "<C-\\><C-n><C-w>j", opts)
keymap('i', '<A-k>', "<C-\\><C-n><C-w>k", opts)
keymap('i', '<A-l>', "<C-\\><C-n><C-w>l", opts)
keymap('n', '<A-h>', "<C-w>h", opts)
keymap('n', '<A-j>', "<C-w>j", opts)
keymap('n', '<A-k>', "<C-w>k", opts)
keymap('n', '<A-l>', "<C-w>l", opts)

-- all select
keymap('n', ',ca', 'ggVGy', opts)

-- open terminal
keymap('t', '<A-h>', "<C-\\><C-n><C-w>h", opts)
keymap('t', '<A-j>', "<C-\\><C-n><C-w>j", opts)
keymap('t', '<A-k>', "<C-\\><C-n><C-w>k", opts)
keymap('t', '<A-l>', "<C-\\><C-n><C-w>l", opts)

-- save files
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>W', ':wa<CR>', opts)

-- close buffer(s)
keymap('n', '<leader>x', ':q<CR>', opts)
keymap('n', '<leader>X', ':qa<CR>', opts)

-- open/close highlight
keymap('n', '<leader><space>', ':set hlsearch!<CR>', opts)

-- Buffers
keymap('n', '<leader>d', ':bdelete<CR>', opts)
keymap('n', '<F10>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<F9>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<leader>bb', ':BufferLinePick<CR>', opts)
keymap('n', ',d', ':b#<bar>bd#<CR>', opts)
keymap('n', ',1', ':BufferLineGoToBuffer 1<CR>', opts)
keymap('n', ',2', ':BufferLineGoToBuffer 2<CR>', opts)
keymap('n', ',3', ':BufferLineGoToBuffer 3<CR>', opts)
keymap('n', ',4', ':BufferLineGoToBuffer 4<CR>', opts)
keymap('n', ',5', ':BufferLineGoToBuffer 5<CR>', opts)
keymap('n', ',6', ':BufferLineGoToBuffer 6<CR>', opts)
keymap('n', ',7', ':BufferLineGoToBuffer 7<CR>', opts)
keymap('n', ',8', ':BufferLineGoToBuffer 8<CR>', opts)
keymap('n', ',9', ':BufferLineGoToBuffer 9<CR>', opts)

-- moving in wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indent
keymap('x', '<', "<gv", opts)
keymap('x', '>', ">gv", opts)

-- move selected line(s)
keymap('x', 'J', ":move \'>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move \'<-2<CR>gv-gv", opts)

-- scape visual mode
keymap('x', 'ii', "<ESC>", opts)

-- alternative esc
keymap('i', 'kk', "<Esc>", opts)

-- navigate display lines
keymap('i', '<Down>', "<Esc>gja", opts)
keymap('i', '<Up>', "<Esc>gka", opts)

-- escape in terminal
keymap('t', '<Esc>', [[<C-\><C-n>]])

-- open dashboard
keymap('n', '<leader>a', ':Dashboard<CR>', opts)

-- open emmet
keymap('n', '<leader>y', ":Emmet ", opts)

-- open glow
keymap('n', '<leader>,', ':Glow<CR>', opts)

-- files explores
keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>", opts)
keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>", opts)
keymap('n', '<leader>fo', ":lua require('telescope.builtin').oldfiles()<cr>", opts)
keymap('n', '<leader>fk', ":lua require('telescope.builtin').keymaps()<cr>", opts)
keymap('n', '<leader>fl', ":lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
keymap('n', '<leader>ft', ":Telescope <CR>", opts)
keymap('n', '<leader>fz', ":lua require('fzf-lua').builtin()<CR>", opts)
keymap('n', '<leader>fm', ":lua require('fzf-lua').files()<CR>", opts)
keymap('n', '<C-n>', ":Neotree<CR>", opts)
keymap('n', '<leader>fb', ":Neotree buffers<CR>", opts)

-- word search
keymap('n', '<leader>h', ':HopWord<CR>', opts)

-- lsp
keymap('n', '<leader>m', ':Mason<CR>', opts)
keymap('n', '<leader>lt', ":Trouble<CR>", opts)

-- git
keymap('n', '<leader>gb', ':lua require"gitsigns".blame_line()<CR>', opts)
keymap('n', '<leader>gl', ':LazyGit<CR>', opts)
keymap('n', '<leader>go', ':Octo actions<CR>', opts)

-- notes
keymap('n', '<leader>nd', ":!rm -rf note.md<CR>", opts)
keymap('n', '<leader>no', ":e note.md<CR>", opts)

-- packer
keymap('n', '<leader>ps', ':PackerSync<CR>', opts)
keymap('n', '<leader>pi', ':PackerInstall<CR>', opts)
keymap('n', '<leader>pu', ':PackerUpdate<CR>', opts)
keymap('n', '<leader>pc', ':PackerClean<CR>', opts)

-- test
keymap('n', '<leader>nf', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
keymap('n', '<leader>nu', ":lua require('neotest').run.run()<CR>", opts)
keymap('n', '<leader>na', ":lua require('neotest').run.run(vim.fn.getcwd())<CR>", opts)
keymap('n', '<leader>ns', ":lua require('neotest').summary.open()<CR>", opts)
