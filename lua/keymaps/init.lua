local map = require('keymaps.map')

map.select('<', '<gv', 'Move selection to left')
map.select('>', '>gv', 'Move selection to right')
map.select('J', ":move '>+1<CR>gv-gv", 'Move line down')
map.select('K', ":move '<-2<CR>gv-gv", 'Move line up')

map.insert('kk', '<Esc>', 'Esc insert mode')
map.insert('kj', '<CR>', 'Enter')

map.normal('<Up>', ':resize -5<CR>')
map.normal('<Right>', ':vertical resize +5<CR>')
map.normal('<Left>', 'Vertical resize -5')
map.normal('<Down>', ':resize +5<CR>')
map.normal('k', 'v:count == 0 ? "gk" : "k"', 'N/A', true)
map.normal('j', 'v:count == 0 ? "gj" : "j"', 'N/A', true)
map.normal('<C-k>', ':bnext<CR>', 'Go to next buffer')
map.normal('<C-j>', ':bprevious<CR>', 'Go to previous buffer')
map.normal('<A-h>', '<C-w>h', 'Move windows left')
map.normal('<A-j>', '<C-w>j', 'Move windows down')
map.normal('<A-k>', '<C-w>k', 'Move windows up')
map.normal('<A-l>', '<C-w>l', 'Move windows right')

map.normal('<leader><space>', ':set hlsearch!<CR>', 'Highlight search')
map.normal('<leader>nd', ':!rm -rf note.md<CR>', 'Note delete')
map.normal('<leader>no', ':e note.md<CR>', 'Note open')
map.normal('<leader>x', ':q<CR>', 'Exit')
map.normal('<leader>w', ':w<CR>', 'Save buffer')
map.normal('<leader>W', ':wa<CR>', 'Save all')
map.normal('<leader>d', ':bdelete<CR>', 'Delete buffer')
map.normal(
  '<leader>c',
  ':lua vim.opt.statuscolumn = "%l %r"<CR>',
  'Show line number'
)
map.normal(
  '<leader>C',
  ':lua vim.opt.statuscolumn = ""<CR>',
  'Remove line number'
)
map.normal(
  '<leader>ha',
  ':lua require("harpoon.mark").add_file()<CR>',
  'Harpoon add file'
)
map.normal(
  '<leader>ht',
  ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  'Harpoon toggle'
)
map.normal(
  '<leader>1',
  ':lua require("harpoon.ui").nav_file(1)<CR>',
  'Harpoon file 1'
)
map.normal(
  '<leader>2',
  ':lua require("harpoon.ui").nav_file(2)<CR>',
  'Harpoon file 2'
)
map.normal(
  '<leader>3',
  ':lua require("harpoon.ui").nav_file(3)<CR>',
  'Harpoon file 3'
)
map.normal(
  '<leader>4',
  ':lua require("harpoon.ui").nav_file(4)<CR>',
  'Harpoon file 4'
)
