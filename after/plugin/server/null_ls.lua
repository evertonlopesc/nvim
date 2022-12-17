local nls = require "null-ls"
local blts = nls.builtins

local sources = {
  blts.formatting.erb_lint,
  blts.formatting.prettier,
  blts.formatting.markdownlint,
  blts.formatting.rubocop,
  blts.formatting.stylua,

  blts.code_actions.gitsigns,
}

nls.setup {
  sources = sources,
}
