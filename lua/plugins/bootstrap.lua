M = {
  {
    'echasnovski/mini.files',
    version = '*',
    config = true,
    keys = {
      { '<leader>fm', ':lua MiniFiles.open() <CR>', desc = 'Open MiniFiles' },
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      close_if_last_window = false,
      window = {
        -- position = 'right',
        width = 80,
        mappings = {
          ['o'] = 'open',
          ['<space>'] = 'none',
        },
      },
      filesystem = {
        follow_current_file = { enabled = true},
        window = {
          mappings = {
            ['o'] = 'open',
          },
        },
      },
      event_handlers = {
        {
          event = 'file_opened',
          handler = function(file_path)
            require('neo-tree').close_all()
          end,
        },
      },
    },
    keys = {
      { '<leader>fe', ':Neotree toggle right <CR>', desc = 'Open Neotree' },
    },
    init = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    end,
    cmd = 'Neotree',
    config = true,
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
