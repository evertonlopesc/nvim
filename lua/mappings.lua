vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

-- vim.keymap.set('', '', "", {})
-- Reload file lua
vim.keymap.set('n', '<leader>rr', ":source ~/.config/nvim/init.lua <CR>", {})

-- TrailingWhiteSpace
vim.keymap.set('n', '<F2>', ":%s/\\s*$//<CR>", opts)

-- Resizes
vim.keymap.set('n', '<Down>', ":resize -5<CR>", opts)
vim.keymap.set('n', '<Up>', ":resize +5<CR>", opts)
vim.keymap.set('n', '<Left>', ":vertical resize -5<CR>", opts)
vim.keymap.set('n', '<Right>', ":vertical resize +5<CR>", opts)

-- move between split
vim.keymap.set('n', '<C-h>', "<C-w>h", {})
vim.keymap.set('n', '<C-j>', "<C-w>j", {})
vim.keymap.set('n', '<C-k>', "<C-w>k", {})
vim.keymap.set('n', '<C-l>', "<C-w>l", {})

-- all select
vim.keymap.set('n', ',ca', 'ggVGy')

-- open terminal
vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', {})

-- save files
vim.keymap.set('n', '<leader>w', ':w<CR>', {})
vim.keymap.set('n', '<leader>W', ':wa<CR>', {})

-- close buffer(s)
vim.keymap.set('n', '<leader>x', ':q<CR>', {})
vim.keymap.set('n', '<leader>X', ':qa<CR>', {})

-- open/close highlight
vim.keymap.set('n', '<leader><space>', ':set hlsearch!<CR>', {})

-- Buffers
vim.keymap.set('n', '<leader>d', ':bdelete<CR>', {})
vim.keymap.set('n', '<F10>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<F9>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>bb', ':BufferLinePick<CR>', {})
vim.keymap.set('n', ',d', ':b#<bar>bd#<CR>')
vim.keymap.set('n', ',1', ':BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', ',2', ':BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', ',3', ':BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', ',4', ':BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', ',5', ':BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', ',6', ':BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', ',7', ':BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', ',8', ':BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', ',9', ':BufferLineGoToBuffer 9<CR>')

-- moving in wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indent
vim.keymap.set('x', '<', "<gv")
vim.keymap.set('x', '>', ">gv")

-- move selected line(s)
vim.keymap.set('x', 'J', ":move \'>+1<CR>gv-gv")
vim.keymap.set('x', 'K', ":move \'<-2<CR>gv-gv")

-- scape visual mode
vim.keymap.set('x', 'ii', "<ESC>")

-- alternative esc
vim.keymap.set('i', 'kk', "<Esc>")

-- navigate display lines
vim.keymap.set('i', '<Down>', "<Esc>gja")
vim.keymap.set('i', '<Up>', "<Esc>gka")

-- escape in terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- open dashboard
vim.keymap.set('n', '<leader>a', ':Dashboard<CR>', {})

-- open emmet
vim.keymap.set('n', '<leader>y', ":Emmet ", {})

-- files explores
vim.keymap.set('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>", {})
vim.keymap.set('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>", {})
vim.keymap.set('n', '<leader>fo', ":lua require('telescope.builtin').oldfiles()<cr>", {})
vim.keymap.set('n', '<leader>fk', ":lua require('telescope.builtin').keymaps()<cr>", {})
vim.keymap.set('n', '<leader>ft', ":Telescope <CR>", {})
vim.keymap.set('n', '<leader>fm', ":lua require('fzf-lua').builtin()<CR>", {})
vim.keymap.set('n', '<leader>fz', ":lua require('fzf-lua').files()<CR>", {})
vim.keymap.set('n', '<C-n>', ":NvimTreeToggle<CR>", {})

-- word search
vim.keymap.set('n', '<leader>m', ':HopWord<CR>')

-- lsp
vim.keymap.set('n', '<leader>lc', ':LspInstallInfo<CR>', {})
vim.keymap.set('n', '<leader>lt', ":Trouble<CR>", {})

-- git
vim.keymap.set('n', '<leader>gb', ':lua require"gitsigns".blame_line()<CR>', {})
vim.keymap.set('n', '<leader>gl', ':LazyGit<CR>', {})
vim.keymap.set('n', '<leader>go', ':Octo actions<CR>', {})

-- notes
vim.keymap.set('n', '<leader>nd', ":!rm -rf note.md<CR>", {})
vim.keymap.set('n', '<leader>no', ":e note.md<CR>", {})

-- packer
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>', {})
vim.keymap.set('n', '<leader>pi', ':PackerInstall<CR>', {})
vim.keymap.set('n', '<leader>pu', ':PackerUpdate<CR>', {})
vim.keymap.set('n', '<leader>pc', ':PackerClean<CR>', {})
