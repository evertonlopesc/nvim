local keymap = vim.keymap.set

keymap(
  'n',
  '<leader>rr',
  ':source % <CR>',
  { desc = 'Refresh', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>S',
  ':%s/<c-r><c-w>//g<left><left>',
  { desc = 'Replace cursor all', noremap = true, silent = false }
)
keymap(
  'n',
  'k',
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, noremap = true, silent = false }
)
keymap(
  'n',
  'j',
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, noremap = true, silent = false }
)
keymap(
  'n',
  '<Down>',
  ':resize -5<CR>',
  { desc = 'Resize -5', noremap = true, silent = false }
)
keymap(
  'n',
  '<Up>',
  ':resize +5<CR>',
  { desc = 'Resize +5', noremap = true, silent = false }
)
keymap(
  'n',
  '<Left>',
  ':vertical resize -5<CR>',
  { desc = 'Vertical resize -5', noremap = true, silent = false }
)
keymap(
  'n',
  '<Right>',
  ':vertical resize +5<CR>',
  { desc = 'Vertical resize +5', noremap = true, silent = false }
)
keymap(
  'n',
  '<C-k>',
  '<cmd>bnext<CR>',
  { desc = 'Next buffer', noremap = true, silent = false }
)
keymap(
  'n',
  '<C-j>',
  '<cmd>bprevious<CR>',
  { desc = 'Previous buffer', noremap = true, silent = false }
)
keymap(
  'n',
  '<A-h>',
  '<C-w>h',
  { desc = 'Move windows left', noremap = true, silent = false }
)
keymap(
  'n',
  '<A-j>',
  '<C-w>j',
  { desc = 'Move windows down', noremap = true, silent = false }
)
keymap(
  'n',
  '<A-k>',
  '<C-w>k',
  { desc = 'Move windows up', noremap = true, silent = false }
)
keymap(
  'n',
  '<A-l>',
  '<C-w>l',
  { desc = 'Move windows right', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader><space>',
  ':set hlsearch!<CR>',
  { desc = 'Highlight', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>ca',
  'ggVGy',
  { desc = 'Copy all', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>d',
  ':bdelete<CR>',
  { desc = 'Delete buffer', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>ss',
  ':HopWord<CR>',
  { desc = 'Hop word', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>nd',
  ':!rm -rf note.md<CR>',
  { desc = 'Delete note', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>no',
  ':e note.md<CR>',
  { desc = 'Open note', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>x',
  ':q<CR>',
  { desc = 'Exit', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>X',
  ':qa<CR>',
  { desc = 'Exit without save', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>w',
  ':w<CR>',
  { desc = 'Save', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>W',
  ':wa<CR>',
  { desc = 'Save all', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>u',
  ':ma ',
  { desc = 'Create mark', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>h',
  ':vert help ',
  { desc = 'Open help', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>n',
  ':Lazy<CR>',
  { desc = 'Lazy', noremap = true, silent = false }
)
keymap(
  'x',
  '<',
  '<gv',
  { desc = '', noremap = true, silent = false }
)
keymap(
  'x',
  '>',
  '>gv',
  { desc = '', noremap = true, silent = false }
)
keymap(
  'x',
  'J',
  ":move '>+1<CR>gv-gv",
  { desc = 'Move line down', noremap = true, silent = false }
)
keymap(
  'x',
  'K',
  ":move '<-2<CR>gv-gv",
  { desc = 'Move line up', noremap = true, silent = false }
)
keymap(
  'i',
  'kk',
  '<Esc>',
  { desc = 'Esc insert mode', noremap = true, silent = false }
)
keymap(
  'x',
  '<leader>gh',
  ':Gitsigns select_hunk<cr>',
  { desc = 'Select hunk', noremap = true, silent = false }
)
keymap(
  'i',
  'kj',
  '<CR>',
  { desc = 'Enter', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>cm',
  ":CellularAutomaton make_it_rain<CR>",
  { desc = 'Make it rain', noremap = true, silent = false }
)
keymap(
  'n',
  '<leader>cg',
  ":CellularAutomaton game_of_life<CR>",
  { desc = 'Game of life', noremap = true, silent = false }
)
