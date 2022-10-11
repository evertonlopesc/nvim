local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local util = require "vim.lsp.util"

vim.diagnostic.config { virtual_text = false }

local M = {}

M.config = function(client, bufnr)
  keymap("n", "<space>e", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)
  keymap("n", "<space>q", vim.diagnostic.setloclist, opts)

  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local vlsp = vim.lsp.buf

    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap("n", "<leader>lD", vlsp.declaration, opts)
    keymap("n", "<leader>ld", vlsp.definition, opts)
    keymap("n", "K", vlsp.hover, opts)
    keymap("n", "<leader>li", vlsp.implementation, opts)
    keymap("n", "<C-k>", vlsp.signature_help, opts)
    keymap("n", "<leader>lt", vlsp.type_definition, opts)
    keymap("n", "<leader>lr", vlsp.rename, opts)
    keymap("n", "<leader>lc", vlsp.code_action, opts)
    keymap("n", "gr", vlsp.references, opts)
    keymap("n", "<leader>lf", vlsp.format, opts)
  end

  return on_attach
end

return M
