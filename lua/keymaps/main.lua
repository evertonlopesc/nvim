local nmap = require('./../config/map').nmap
local xmap = require('./../config/map').xmap
local imap = require('./../config/map').imap

nmap('<leader>rr', ':source % <CR>')
nmap('<leader>S', ':%s/<c-r><c-w>//g<left><left>')
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
nmap('<Down>', ':resize -5<CR>')
nmap('<Up>', ':resize +5<CR>')
nmap('<Left>', ':vertical resize -5<CR>')
nmap('<Right>', ':vertical resize +5<CR>')
nmap('<C-k>', '<cmd>bnext<CR>')
nmap('<C-j>', '<cmd>bprevious<CR>')
nmap('<A-h>', '<C-w>h')
nmap('<A-j>', '<C-w>j')
nmap('<A-k>', '<C-w>k')
nmap('<A-l>', '<C-w>l')
nmap('<leader><space>', ':set hlsearch!<CR>')
nmap('<leader>,', ':Glow<CR>')
nmap('<leader>ca', 'ggVGy')
nmap('<leader>d', ':bdelete<CR>')
nmap('<leader>ss', ':HopWord<CR>')
nmap('<leader>nd', ':!rm -rf note.md<CR>')
nmap('<leader>no', ':e note.md<CR>')
nmap('<leader>o', ':Octo actions<CR>')
nmap('<leader>x', ':q<CR>')
nmap('<leader>X', ':qa<CR>')
nmap('<leader>w', ':w<CR>')
nmap('<leader>W', ':wa<CR>')
nmap('<leader>y', ':Emmet ')
nmap('<leader>u', ':ma ')
nmap('<leader>ps', ':PackerSync<CR>')
nmap('<leader>pi', ':PackerInstall<CR>')
nmap('<leader>pu', ':PackerUpdate<CR>')
nmap('<leader>pc', ':PackerClean<CR>')
nmap('<leader>h', ':vert help ')
xmap('<', '<gv')
xmap('>', '>gv')
xmap('J', ":move '>+1<CR>gv-gv")
xmap('K', ":move '<-2<CR>gv-gv")
imap('kk', '<Esc>')
imap('<A-h>', '<C-\\><C-n><C-w>h')
imap('<A-j>', '<C-\\><C-n><C-w>j')
imap('<A-k>', '<C-\\><C-n><C-w>k')
imap('<A-l>', '<C-\\><C-n><C-w>l')
