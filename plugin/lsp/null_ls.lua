local nls = require('null-ls')
local blts = nls.builtins
local on_attach = require('lsp.config').config(client, bufnr)

local sources = {
  -- Diagnostics
  blts.diagnostics.erb_lint,
  -- blts.diagnostics.eslint_d,

  -- Formatting
  blts.formatting.erb_lint,
  blts.formatting.prettier,
}

nls.setup({
  sources = sources,
  on_attach = on_attach,
})
