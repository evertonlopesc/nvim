local function lsp_server_name()
  local msg = 'none'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end

  return msg
end

local p = require('rose-pine.palette')

require('lualine').setup({
  options = {
    theme = 'onedark',
    component_separators = '',
    icons_enabled = false,
    section_separators = ' ',
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
    },
    lualine_c = {
      '%=',
      { lsp_server_name, color = { fg = p.gold, gui = 'italic' } },
    },
    lualine_x = {},
    lualine_y = { 'searchcount', 'filetype', 'encoding', 'location', '%p%%/%L' },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
  extensions = { 'neo-tree', 'quickfix' },
  winbar = {
    lualine_a = { { 'filename', path = 1, color = { gui = 'italic' } }, '%r%h' },
    lualine_b = { 'diagnostic' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
