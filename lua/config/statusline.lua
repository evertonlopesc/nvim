require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = auto,
    component_separators = { left = '|', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    -- LEFT
    lualine_a = { 'mode', },
    lualine_b = {
      {
        function()
          return "%f% "
        end,
        icon = ' ',
        file_status = true,
        path = 0,
        shorting_target = 40,
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified.
          readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
        },
      },
      {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
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
        end,
      },
    },
    lualine_c = {
      'diff',
      'diagnostics',
    },

    -- RIGHT
    lualine_x = {
      'branch',
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      'progress',
      'location'
    },
    lualine_z = {''}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
