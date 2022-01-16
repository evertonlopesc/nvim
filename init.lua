require ("plugins")
require ("editor")
require ("mappings")

vim.cmd [[ autocmd BufEnter * :syntax sync fromstart ]]
