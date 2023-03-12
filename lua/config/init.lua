require('config.lazy')
require('config.options')
require('config.autocommands')

local background = 'light'

if background == 'dark' then
  vim.opt.background = background
  vim.cmd.colorscheme('nightfox')
else
  vim.opt.background = background
  require('github-theme').setup({
    theme_style = background,
  })
end
