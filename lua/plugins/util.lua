M = {
  {
    'ellisonleao/glow.nvim',
    event = 'BufReadPost',
    opts = {
      width = 120,
    },
    config = true,
    cmd = 'Glow',
    ft = 'markdown',
  },

  {
    'iamcco/markdown-preview.nvim',
    event = 'BufReadPost',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' },
    cmd = 'MarkdownPreview',
  },

  {
    'Massolari/forem.nvim',
    opts = {
      api_key = '5tJYZZL3bcrKsHYmYgSfabUc',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    cmd = 'Forem',
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
    },
    ft = { 'rb' },
    opts = {
      adapters = function()
        require('neotest-rspec')
      end,
    },
    config = true,
    keys = {
      {
        '<leader>nf',
        ":Neotest run.run(vim.fn.expand('%'))<CR>",
        desc = 'Run test file',
      },
      { '<leader>nu', ':Neotest run.run()<CR>',      desc = 'Run test cursor' },
      { '<leader>ns', ':Neotest summary.open()<CR>', desc = 'Test summary' },
    },
    cmd = 'Neotest',
  },

  {
    'folke/which-key.nvim',
    config = true,
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'suketa/nvim-dap-ruby',
      config = function()
        local dap = require("dap")
        dap.adapters.ruby = function(callback, config)
          callback {
            type = "server",
            host = "127.0.0.1",
            port = "${port}",
            executable = {
              command = "bundle",
              args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
                "-c", "--", "bundle", "exec", config.command, config.script,
              },
            },
          }
        end

        dap.configurations.ruby = {
          {
            type = "ruby",
            name = "debug current file",
            request = "attach",
            localfs = true,
            command = "ruby",
            script = "${file}",
          },
          {
            type = "ruby",
            name = "run current spec file",
            request = "attach",
            localfs = true,
            command = "rspec",
            script = "${file}",
          },
        }
      end
    },
    ft = { 'rb', 'erb' },
    keys = {
      {
        '<leader>Dt',
        ":lua require'dap '.toggle_breakpoint()<CR>",
        desc = 'Dap toggle_breakpoint',
      },
      {
        '<leader>Dc',
        ":lua require'dap'.continue()<CR>",
        desc = 'Dap continue',
      },
      {
        '<leader>Ds',
        ":lua require'dap'.step_over()",
        desc = 'Dap step over',
      },
      {
        '<leader>Di',
        ":lua require'dap'.step_into()",
        desc = 'Dap step into',
      },
      {
        '<leader>Dr',
        ":lua require'dap'.repl.open()",
        desc = 'Dap repl open',
      },
    },
  },

  {
    'potamides/pantran.nvim',
    opts = {
      default_engine = 'yandex',
      engines = {
        yandex = {
          default_source = 'auto',
          default_target = 'pt-br',
        },
      },
    },
    keys = {
      {
        '<leader>tr',
        ':Pantran motion_translate<CR>',
        desc = 'Motion translate',
      },
      {
        mode = 'x',
        '<leader>tr',
        ':Pantran motion_translate<CR>',
        desc = 'Motion translate',
      },
    },
  },
}

return M
