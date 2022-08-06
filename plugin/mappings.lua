vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Reload file lua
keymap('n', '<leader>rr', ":source % <CR>", {})

-- TrailingWhiteSpace
keymap('n', '<F2>', ":%s/\\s*$//<CR>", opts)

-- Resizes
keymap('n', '<Down>', ":resize -5<CR>", opts)
keymap('n', '<Up>', ":resize +5<CR>", opts)
keymap('n', '<Left>', ":vertical resize -5<CR>", opts)
keymap('n', '<Right>', ":vertical resize +5<CR>", opts)

-- move between split
keymap('n', '<C-h>', "<C-w>h", {})
keymap('n', '<C-j>', "<C-w>j", {})
keymap('n', '<C-k>', "<C-w>k", {})
keymap('n', '<C-l>', "<C-w>l", {})

-- all select
keymap('n', ',ca', 'ggVGy')

-- open terminal
keymap('n', '<c-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', {})
keymap('t', '<c-t>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', {})

-- save files
keymap('n', '<leader>w', ':w<CR>', {})
keymap('n', '<leader>W', ':wa<CR>', {})

-- close buffer(s)
keymap('n', '<leader>x', ':q<CR>', {})
keymap('n', '<leader>X', ':qa<CR>', {})

-- open/close highlight
keymap('n', '<leader><space>', ':set hlsearch!<CR>', {})

-- Buffers
keymap('n', '<leader>d', ':bdelete<CR>', {})
keymap('n', '<F10>', ':BufferLineCycleNext<CR>')
keymap('n', '<F9>', ':BufferLineCyclePrev<CR>')
keymap('n', '<leader>bb', ':BufferLinePick<CR>', {})
keymap('n', ',d', ':b#<bar>bd#<CR>')
keymap('n', ',1', ':BufferLineGoToBuffer 1<CR>')
keymap('n', ',2', ':BufferLineGoToBuffer 2<CR>')
keymap('n', ',3', ':BufferLineGoToBuffer 3<CR>')
keymap('n', ',4', ':BufferLineGoToBuffer 4<CR>')
keymap('n', ',5', ':BufferLineGoToBuffer 5<CR>')
keymap('n', ',6', ':BufferLineGoToBuffer 6<CR>')
keymap('n', ',7', ':BufferLineGoToBuffer 7<CR>')
keymap('n', ',8', ':BufferLineGoToBuffer 8<CR>')
keymap('n', ',9', ':BufferLineGoToBuffer 9<CR>')

-- moving in wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indent
keymap('x', '<', "<gv")
keymap('x', '>', ">gv")

-- move selected line(s)
keymap('x', 'J', ":move \'>+1<CR>gv-gv")
keymap('x', 'K', ":move \'<-2<CR>gv-gv")

-- scape visual mode
keymap('x', 'ii', "<ESC>")

-- alternative esc
keymap('i', 'kk', "<Esc>")

-- navigate display lines
keymap('i', '<Down>', "<Esc>gja")
keymap('i', '<Up>', "<Esc>gka")

-- escape in terminal
keymap('t', '<Esc>', [[<C-\><C-n>]])

-- open dashboard
keymap('n', '<leader>a', ':Dashboard<CR>', {})

-- open emmet
keymap('n', '<leader>y', ":Emmet ", {})

-- open glow
keymap('n', '<leader>,', ':Glow<CR>', {})

-- files explores
keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>", {})
keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>", {})
keymap('n', '<leader>fo', ":lua require('telescope.builtin').oldfiles()<cr>", {})
keymap('n', '<leader>fk', ":lua require('telescope.builtin').keymaps()<cr>", {})
keymap('n', '<leader>ft', ":Telescope <CR>", {})
keymap('n', '<leader>fz', ":lua require('fzf-lua').builtin()<CR>", {})
keymap('n', '<leader>fm', ":lua require('fzf-lua').files()<CR>", {})
keymap('n', '<C-n>', ":Neotree<CR>", {})
keymap('n', '<leader>fb', ":Neotree buffers<CR>", {})

-- word search
keymap('n', '<leader>m', ':HopWord<CR>')

-- lsp
keymap('n', '<leader>lc', ':LspInstallInfo<CR>', {})
keymap('n', '<leader>lt', ":Trouble<CR>", {})

-- git
keymap('n', '<leader>gb', ':lua require"gitsigns".blame_line()<CR>', {})
keymap('n', '<leader>gl', ':LazyGit<CR>', {})
keymap('n', '<leader>go', ':Octo actions<CR>', {})

-- notes
keymap('n', '<leader>nd', ":!rm -rf note.md<CR>", {})
keymap('n', '<leader>no', ":e note.md<CR>", {})

-- packer
keymap('n', '<leader>ps', ':PackerSync<CR>', {})
keymap('n', '<leader>pi', ':PackerInstall<CR>', {})
keymap('n', '<leader>pu', ':PackerUpdate<CR>', {})
keymap('n', '<leader>pc', ':PackerClean<CR>', {})
