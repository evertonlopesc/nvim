local nls = require('null-ls')
local blts = nls.builtins

nls.setup({
  sources = {
    blts.formatting.erb_lint,
    blts.formatting.rubocop,
    blts.formatting.stylua,
    blts.formatting.prettierd,
    blts.formatting.markdownlint,

    blts.code_actions.gitsigns,
    blts.code_actions.eslint_d,
  }
})
