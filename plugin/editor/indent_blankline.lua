local opt = vim.opt
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	show_current_context_start = true,
	show_end_of_line = true,
	filetype_exclude = {
		"help",
		"terminal",
		"dashboard",
		"checkhealt",
		"packer",
    "neotree",
	},
})
