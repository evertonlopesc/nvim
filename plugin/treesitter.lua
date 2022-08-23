require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'regex',
    'typescript',
    'c',
    'slint',
    'hjson',
    'cpp',
    'markdown_inline',
    'bash',
    'html',
    'toml',
    'json',
    'commonlisp',
    'vue',
    'make',
    'http',
    'json5',
    'markdown',
    'lua',
    'help',
    'dockerfile',
    'vim',
    'nix',
    'cmake',
    'rust',
    'fennel',
    'latex',
    'fish',
    'graphql',
    'ruby',
    'css',
    'sql',
    'scss',
    'go',
    'python',
    'elixir',
    'yaml',
    'elm',
    'query',
    'embedded_template',
    'javascript',
    'tsx',
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  highlight = { enable = true, disable = {} },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_line = nil
  }
}
