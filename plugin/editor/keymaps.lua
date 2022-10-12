local opts = { noremap = true, silent = true }

local function keymap(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Reload file lua
keymap("n", "<leader>rr", ":source % <CR>", opts)

-- TrailingWhiteSpace
keymap("n", "<F2>", ":%s/\\s*$//<CR>", opts)

-- Resizes
keymap("n", "<Down>", ":resize -5<CR>", opts)
keymap("n", "<Up>", ":resize +5<CR>", opts)
keymap("n", "<Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<Right>", ":vertical resize +5<CR>", opts)

-- move between split
keymap("i", "<A-h>", "<C-\\><C-n><C-w>h", opts)
keymap("i", "<A-j>", "<C-\\><C-n><C-w>j", opts)
keymap("i", "<A-k>", "<C-\\><C-n><C-w>k", opts)
keymap("i", "<A-l>", "<C-\\><C-n><C-w>l", opts)
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- all select
keymap("n", ",ca", "ggVGy", opts)

-- save files
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>W", ":wa<CR>", opts)

-- close buffer(s)
keymap("n", "<leader>x", ":q<CR>", opts)
keymap("n", "<leader>X", ":qa<CR>", opts)

-- open/close highlight
keymap("n", "<leader><space>", ":set hlsearch!<CR>", opts)

-- Buffers
keymap("n", "<leader>d", ":bdelete<CR>", opts)
keymap("n", "<F10>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<F9>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>bb", ":BufferLinePick<CR>", opts)
keymap("n", ",d", ":b#<bar>bd#<CR>", opts)
keymap("n", ",b", ":buffers<CR>", opts)
keymap("n", ",g", ":buff ", opts)

-- moving in wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indent
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- move selected line(s)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- alternative esc
keymap("i", "kk", "<Esc>", opts)

-- open dashboard

-- open emmet
keymap("n", "<leader>y", ":Emmet ", opts)

-- open glow
keymap("n", "<leader>,", ":Glow<CR>", opts)

-- word search
keymap("n", "<leader>h", ":HopWord<CR>", opts)

-- git
keymap("n", "<leader>go", ":Octo actions<CR>", opts)

-- notes
keymap("n", "<leader>nd", ":!rm -rf note.md<CR>", opts)
keymap("n", "<leader>no", ":e note.md<CR>", opts)

-- Ruby
keymap("n", "<leader>ry", ":RubyRun<CR>", opts)
