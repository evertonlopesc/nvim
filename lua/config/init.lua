require('config.lazy')
require('config.options')
require('config.auto_command')

vim.opt.background = 'light'
-- vim.cmd.colorscheme('rose-pine')

require('github-theme').setup({
  theme_style = 'light',
  comment_style = "italic",
  keyword_style = "bold",
  function_style = "bold",
  variable_style = "NONE"
})
