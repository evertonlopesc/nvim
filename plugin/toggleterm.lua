require("toggleterm").setup {
  direction = 'vertical',
  size = 100,
  insert_mappings = false,
  shade_terminals = false,
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', '<ESC>', opts)
  vim.keymap.set('t', '<C-LEFT>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-DOWN>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-UP>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-RIGHT>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- open terminal
local Terminal = require('toggleterm.terminal').Terminal
local w3m = Terminal:new({ 
  cmd = 'w3m https://google.com', direction = 'vertical', hidden = true })
local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'tab',
  hidden = true, 
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _w3m_toggle()
  w3m:toggle()
end

vim.keymap.set('n', '<leader>tt', '<Cmd>lua _lazygit_toggle()<CR>')
vim.keymap.set('n', '<leader>tw', '<Cmd>lua _w3m_toggle()<CR>')
