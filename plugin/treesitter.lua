require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'regex',
    'typescript',
    'markdown_inline',
    'bash',
    'html',
    'json',
    'vue',
    'json5',
    'markdown',
    'lua',
    'dockerfile',
    'vim',
    'rust',
    'fish',
    'ruby',
    'css',
    'sql',
    'scss',
    'yaml',
    'query',
    'embedded_template',
    'javascript',
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
