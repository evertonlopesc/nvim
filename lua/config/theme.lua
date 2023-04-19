local M = {}

function M.get_theme_color()
  local command = 'gsettings get org.gnome.desktop.interface gtk-theme'
  local result = string.find(vim.fn.system(command), 'dark')

  return result
end

function M.set_theme_color()
  if M.get_theme_color() == nil then
    vim.opt.background = 'light'
    require('github-theme').setup({
      theme_style = 'light',
    })
  else
    vim.opt.background = 'dark'
    vim.cmd.colorscheme('nightfox')
  end
end

return M
