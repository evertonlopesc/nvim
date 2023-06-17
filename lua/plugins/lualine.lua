-- Function with return the servers
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

M = {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'auto',
        component_separators = '',
        icons_enabled = true,
        section_separators = ' ',
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { 'mode', 'branch' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'encoding', 'progress', 'location', '%L:L' },
        lualine_z = { { lsp_server_name } },
      },
      inactive_sections = {
        lualine_c = { '%f %y %m' },
        lualine_x = {},
      },
      extensions = { 'neo-tree', 'quickfix' },
      winbar = {
        lualine_a = {
          { 'filename', path = 1 },
          { 'diff', color = { bg = 'black' } },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
    config = true,
  },
}

return M
