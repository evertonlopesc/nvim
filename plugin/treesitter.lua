require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "elixir",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "regex",
    "ruby",
    "rust",
    "scss",
    "typescript",
    "vim",
    "vue",
    "yaml",
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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr"
