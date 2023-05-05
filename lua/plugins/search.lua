M = {
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    event = 'BufReadPost',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    config = true,
    cmd = 'Hop',
    keys = {
      {
        '<leader>ss', ':HopWord<CR>', desc = 'Hop word'
      },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
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
        find_files            = { theme = 'dropdown' },
        oldfiles              = { theme = 'dropdown' },
        lsp_document_symbols  = { theme = 'dropdown' },
        buffers               = { theme = 'dropdown' },
        keymaps               = { theme = 'dropdown' },
        file_browser          = { theme = 'dropdown' },
        git_status            = { theme = 'dropdown' },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    },
    keys = {
      { '<leader>tt', ':Telescope <CR>',                      desc = 'Telescope'            },
      { '<leader>sf', ':Telescope find_files<CR>',            desc = 'Telescope find files' },
      { '<leader>sg', ':Telescope live_grep<CR>',             desc = 'Telescope live grep'  },
      { '<leader>so', ':Telescope oldfiles<CR>',              desc = 'Telescope old files'  },
      { '<leader>sl', ':Telescope lsp_document_symbols<CR>',  desc = 'Telescope functions'  },
      { '<leader>b',  ':Telescope buffers<CR>',               desc = 'Telescope buffers'    },
      { '<leader>sk', ':Telescope keymaps<CR>',               desc = 'Telescope keymaps'    },
      { '<leader>sh', ':Telescope git_status<CR>',            desc = 'Telescope git status' },
    },
    config = true,
  },

  {
    'windwp/nvim-spectre',
    event = 'BufReadPost',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    keys = {
      { '<leader>r', ':Spectre<CR> right', desc = 'Replace' },
      {
        '<leader>rw',
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = 'Replace word',
      },
      {
        '<leader>rs',
        "<esc>:lua require('spectre').open_visual()<CR>",
        mode = 'v',
        desc = 'Replace select',
      },
      {
        '<leader>rp',
        "viw:lua require('spectre').open_file_search()<CR>",
        desc = 'Replace select',
      },
    },
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
  },
}

return M
