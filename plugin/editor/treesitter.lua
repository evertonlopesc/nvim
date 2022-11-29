local ts = require "nvim-treesitter.configs"

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
  callback = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

ts.setup {
  ensure_installed = {
    "regex",
    "typescript",
    "markdown_inline",
    "html",
    "json",
    "vue",
    "markdown",
    "lua",
    "dockerfile",
    "vim",
    "rust",
    "fish",
    "ruby",
    "css",
    "sql",
    "scss",
    "yaml",
    "embedded_template",
    "javascript",
    'vue',
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
    max_file_line = nil,
  },
}
