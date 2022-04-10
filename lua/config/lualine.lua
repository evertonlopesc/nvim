local colors = {
  black        = '#282828',
  white        = '#EBDBB2',
  vwhite       = '#FFFFFF',
  red          = '#FB4934',
  green        = '#B8BB26',
  blue         = '#83A598',
  yellow       = '#FE8019',
  tyellow      = '#D44C06',
  gray         = '#A89984',
  darkgray     = '#3C3836',
  lightgray    = '#504945',
  inactivegray = '#7C6F64',
  eorange      = '#FFB86C',
}
local themes = require("lualine.themes.onenord")
-- NORMAL MODE
themes.normal.a.fg = colors.black
themes.normal.a.bg = colors.eorange
themes.normal.b.fg = colors.eorange
themes.normal.b.bg = colors.black
themes.normal.c.fg = colors.eorange
themes.normal.c.bg = colors.black

-- VISUAL MODE
themes.visual.a.fg = colors.black
themes.visual.a.bg = colors.eorange
themes.visual.b.fg = colors.eorange
themes.visual.b.bg = colors.black

-- INSERT MODE
themes.insert.a.fg = colors.black
themes.insert.a.bg = colors.eorange
themes.insert.b.fg = colors.eorange
themes.insert.b.bg = colors.black

-- COMMAND MODE
themes.command.a.fg = colors.black
themes.command.a.bg = colors.eorange
themes.command.b.fg = colors.eorange
themes.command.b.bg = colors.black

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = themes,
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
    },
    lualine_c = { 
      'diff',
      'diagnostics'
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
