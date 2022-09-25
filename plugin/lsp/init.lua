local msn = require("mason")
local msn_lspc = require("mason-lspconfig")
local lspc = require("lspconfig")
local servers = msn_lspc.get_installed_servers()
local on_attach = require("lsp.config").config(client, bufnr)

msn.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})


msn_lspc.setup({
	ensure_installed = {
		"sumneko_lua",
	},

	automactic_installation = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspc.sumneko_lua.setup({
	settings = {
		lua = {
			format = { enable = false },
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
