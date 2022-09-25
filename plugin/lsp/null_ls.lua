local nls = require('null-ls')
local blts = nls.builtins
local on_attach = require('lsp.config').config(client, bufnr)

local sources = {
  -- Diagnostics
  blts.diagnostics.erb_lint,

  -- Formatting
  blts.formatting.erb_lint,
  blts.formatting.prettier,
	blts.formatting.stylua,
}

nls.setup({
  sources = sources,
  on_attach = on_attach,
})
