local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.diagnostic.config({ virtual_text = false })

local M = {}

M.config = function(client, bufnr)
	keymap("n", "<space>e", vim.diagnostic.open_float, opts)
	keymap("n", "[d", vim.diagnostic.goto_prev, opts)
	keymap("n", "]d", vim.diagnostic.goto_next, opts)
	keymap("n", "<space>q", vim.diagnostic.setloclist, opts)

	local on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		local vlsp = vim.lsp.buf

		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		keymap("n", "<leader>lD", vlsp.declaration, bufopts)
		keymap("n", "<leader>ld", vlsp.definition, bufopts)
		keymap("n", "K", vlsp.hover, bufopts)
		keymap("n", "<leader>li", vlsp.implementation, bufopts)
		keymap("n", "<C-k>", vlsp.signature_help, bufopts)
		keymap("n", "<leader>lt", vlsp.type_definition, bufopts)
		keymap("n", "<leader>lr", vlsp.rename, bufopts)
		keymap("n", "<leader>lc", vlsp.code_action, bufopts)
		keymap("n", "gr", vlsp.references, bufopts)
		keymap("n", "<leader>lf", vlsp.formatting, bufopts)
	end

	return on_attach
end

return M
