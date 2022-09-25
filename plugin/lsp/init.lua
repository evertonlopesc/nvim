require("mason").setup()

local mason_lspc = require("mason-lspconfig")
local lspc = require("lspconfig")
local servers = mason_lspc.get_installed_servers()
local on_attach = require("lsp.config").config(client, bufnr)

mason_lspc.setup({
	ensure_installed = {
		"sumneko_lua",
		"solargraph",
		"tsserver",
	},

	automactic_installation = true,
})

lspc.sumneko_lua.setup({
	settings = {
		lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

for _, server in ipairs(servers) do
	lspc[server].setup({
		on_attach = on_attach,
	})
end
