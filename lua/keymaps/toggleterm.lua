local m = require('./../config/map')

local nmap = m.nmap
local tmap = m.tmap

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  tmap('<esc>', '<ESC>')
  tmap('\\\\', '<C-\\><C-n>')
  tmap('<C-LEFT>', [[<Cmd>wincmd h<CR>]])
  tmap('<C-DOWN>', [[<Cmd>wincmd j<CR>]])
  tmap('<C-UP>', [[<Cmd>wincmd k<CR>]])
  tmap('<C-RIGHT>', [[<Cmd>wincmd l<CR>]])
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- open terminal
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'tab',
  hidden = true,
})

function _lazygit_toggle()
  lazygit:toggle()
end

tmap('<Esc>', [[<C-\><C-n>]])
tmap('<A-h>', '<C-\\><C-n><C-w>h')
tmap('<A-j>', '<C-\\><C-n><C-w>j')
tmap('<A-k>', '<C-\\><C-n><C-w>k')
tmap('<A-l>', '<C-\\><C-n><C-w>l')
nmap('<c-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', {})
tmap('<c-t>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', {})
nmap('<leader>gt', '<Cmd>lua _lazygit_toggle()<CR>')
