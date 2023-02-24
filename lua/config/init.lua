require('config.lazy')
require('config.options')
require('config.autocommands')

vim.opt.background = 'light'

require('github-theme').setup({
  theme_style = 'light',
  comment_style = 'italic',
  keyword_style = 'bold',
  function_style = 'bold',
  variable_style = 'NONE',
})
