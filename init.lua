require("plugins")
require("lsp_progress_update")

local opt = vim.opt
local api = vim.api

-- Options summary
opt.autoindent = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.encoding = "UTF-8"
opt.expandtab = true
opt.hidden = true
opt.hlsearch = true
opt.history = 5000
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 3
opt.linebreak = true
opt.maxmempattern = 5000
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.showtabline = 2
opt.smartcase = true
opt.spell = true
opt.spelllang = "en"
opt.syntax = "enable"
opt.termguicolors = true
opt.timeoutlen = 300
opt.foldlevelstart = 99

opt.wig = {
	"**/node_module/*",
	"**/coverage/*",
	"**/.git/*",
}

api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		opt.foldmethod = "expr"
		opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})
