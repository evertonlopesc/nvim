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
        theme = 'onedark',
        component_separators = '',
        icons_enabled = true,
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
          { lsp_server_name },
          { 'diagnostic', color = { bg = 'black' } },
        },
        lualine_x = {},
        lualine_y = {
          'searchcount',
          'selectioncount',
          {
            'filetype',
            colored = false,
            icon_only = true,
            icon = { align = 'right' },
          },
          'encoding',
          'progress',
          'location',
        },
        lualine_z = {
          '%L:L',
        },
      },
      inactive_sections = {
        lualine_c = { '%f %y %m' },
        lualine_x = {},
      },
      extensions = { 'neo-tree', 'quickfix' },
      winbar = {
        lualine_a = {
          {
            'buffers',
            show_filename_only = false,
            color = { bg = '#98c379', fg = 'black', gui = 'italic' },
          },
          { '%r%h', color = { bg = 'black', fg = 'white' } },
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
