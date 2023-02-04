local M = {
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    event = 'BufReadPost',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    config = true,
    cmd = 'Hop',
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
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    },
    keys = {
      { '<leader>t', ':Telescope <CR>' },
      { '<leader>f', ':Telescope find_files<cr>' },
      { '<leader>fg', ':Telescope live_grep<cr>' },
      { '<leader>fo', ':Telescope oldfiles<cr>' },
      { '<leader>fl', ':Telescope lsp_document_symbols<cr>' },
      { '<leader>b', ':Telescope buffers<cr>' },
      { '<leader>fk', ':Telescope keymaps<cr>' },
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
      { '<leader>s', ':Spectre<cr> right' },
      { '<leader>sw', "<cmd>lua require('spectre').open_visual({select_word=true})<CR>" },
    },
  },
}

return M
