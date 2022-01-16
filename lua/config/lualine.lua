require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = ' ', right = ' '},
    -- section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      { 'diff', symbols = {added = ' ', modified = ' ', removed = ' '} },
    },
    lualine_c = {
      function()
        return "%f"
      end,
      'filesize',
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {
      function()
        return "%p%%"
      end,
    },
    lualine_z = {'location'}
  },
}
