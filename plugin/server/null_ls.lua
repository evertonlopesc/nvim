local nls = require "null-ls"
local blts = nls.builtins
local on_attach = require("lsp.config").config(client, bufnr)

local sources = {
  blts.formatting.erb_lint,
  blts.formatting.prettier,
  blts.formatting.markdownlint,
  blts.formatting.stylua,

  blts.code_actions.gitsigns,
}

nls.setup {
  sources = sources,
  on_attach = on_attach,
}
