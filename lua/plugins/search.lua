M = {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "<leader>s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
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
        find_files = { theme = 'dropdown' },
        live_grep = { theme = 'dropdown' },
        oldfiles = { theme = 'dropdown' },
        lsp_document_symbols = { theme = 'dropdown' },
        buffers = { theme = 'dropdown' },
        keymaps = { theme = 'dropdown' },
        file_browser = { theme = 'dropdown' },
        git_status = { theme = 'dropdown' },
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
      { '<leader>T', ':Telescope <CR>', desc = 'Telescope' },
      {
        '<leader>f',
        ':Telescope find_files<CR>',
        desc = 'Telescope find files',
      },
      {
        '<leader>F',
        ':Telescope live_grep<CR>',
        desc = 'Telescope live grep',
      },
      {
        '<leader>b',
        ':Telescope buffers<CR>',
        desc = 'Telescope buffers',
      },
    },
    config = true,
  },

  {
    'windwp/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPost',
    keys = { { '<leader>r', ':Spectre<CR> right', desc = 'Replace' } },
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPost',
  },
}

return M
