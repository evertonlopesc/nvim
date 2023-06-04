M = {}

function M.get_color_theme()
  local command = 'gsettings get org.gnome.desktop.interface gtk-theme'

  if string.find(vim.fn.system(command), 'dark') == nil then
    return 'light'
  else
    return 'dark'
  end
end

function M.set_color_theme()
  -- local background = M.get_color_theme()
  local background = 'dark'

  if background == 'light' then
    vim.opt.background = background
    require('github-theme').setup({ theme_style = background })
  else
    vim.opt.background = background
    vim.cmd.colorscheme('dracula')
  end
end

return M
