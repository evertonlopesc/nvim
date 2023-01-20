local M = {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
          },
        },
        pickers = {
          find_files = {
            theme = 'dropdown',
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
          },
          live_grep = {
            theme = 'dropdown',
          },
          oldfiles = {
            theme = 'dropdown',
          },
          lsp_document_symbols = {
            theme = 'dropdown',
          },
          buffers = {
            theme = 'dropdown',
          },
          keymaps = {
            theme = 'dropdown',
          },
          file_browser = {
            theme = 'dropdown',
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<C-n>', '<cmd> Neotree toggle left <cr>', desc = 'Open Neotree' },
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      local neo_tree = require('neo-tree')

      neo_tree.setup({
        close_if_last_window = false,
        window = {
          position = 'left',
          mappings = {
            ['o'] = 'open',
          },
        },

        filesystem = {
          follow_current_file = true,
          window = {
            mappings = {
              ['o'] = 'open',
            },
          },
        },
      })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitsigns').setup({
        current_line_blame = false,
      })
    end,
  },

  {
    'TimUntersberger/neogit',
    keys = {
      { '<leader>g', ':Neogit <CR>', desc = 'Open Neogit' },
      { '<leader>gc', ':Neogit commit <CR>', desc = 'Neogit commit' },
    },
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup({})
    end,
  },

  {
    'jiangmiao/auto-pairs',
  },

  {
    'mattn/emmet-vim',
  },

  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup({})
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
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
          lualine_y = {
            'searchcount',
            'filetype',
            'encoding',
            'location',
            '%p%%/%L',
          },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_c = { '%f %y %m' },
          lualine_x = {},
        },
        extensions = { 'neo-tree', 'quickfix' },
        winbar = {
          lualine_a = {
            { 'filename', path = 1, color = { gui = 'italic' } },
            '%r%h',
          },
          lualine_b = { 'diagnostic' },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      local ntf = require('notify')
      local stages_util = require('notify.stages.util')

      require('telescope').load_extension('notify')

      vim.notify = ntf

      ntf.setup({
        stages = {
          function(state)
            local next_height = state.message.height + 2
            local next_row = stages_util.available_slot(
              state.open_windows,
              next_height,
              stages_util.DIRECTION.BOTTOM_UP
            )
            if not next_row then
              return nil
            end
            return {
              relative = 'editor',
              anchor = 'NE',
              width = state.message.width,
              height = state.message.height,
              col = vim.opt.columns:get(),
              row = next_row,
              border = 'rounded',
              style = 'minimal',
              opacity = 0,
            }
          end,
          function()
            return {
              opacity = { 100 },
              col = { vim.opt.columns:get() },
            }
          end,
          function()
            return {
              col = { vim.opt.columns:get() },
              time = true,
            }
          end,
          function()
            return {
              width = {
                1,
                frequency = 2.5,
                damping = 0.9,
                complete = function(cur_width)
                  return cur_width < 3
                end,
              },
              opacity = {
                0,
                frequency = 2,
                complete = function(cur_opacity)
                  return cur_opacity <= 4
                end,
              },
              col = { vim.opt.columns:get() },
            }
          end,
        },
        timeout = 5000,
      })
    end,
  },
}

return M
