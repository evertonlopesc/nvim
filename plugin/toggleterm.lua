local keymap = vim.keymap.set

require("toggleterm").setup({
	direction = "vertical",
	size = 100,
	insert_mappings = false,
	shade_terminals = false,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	keymap("t", "<esc>", "<ESC>", opts)
	keymap("t", "\\\\", "<C-\\><C-n>", opts)
	keymap("t", "<C-LEFT>", [[<Cmd>wincmd h<CR>]], opts)
	keymap("t", "<C-DOWN>", [[<Cmd>wincmd j<CR>]], opts)
	keymap("t", "<C-UP>", [[<Cmd>wincmd k<CR>]], opts)
	keymap("t", "<C-RIGHT>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- open terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "tab",
	hidden = true,
})

function _lazygit_toggle()
	lazygit:toggle()
end

keymap("n", "<c-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', {})
keymap("t", "<c-t>", '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', {})
keymap("n", "<leader>tt", "<Cmd>lua _lazygit_toggle()<CR>")
