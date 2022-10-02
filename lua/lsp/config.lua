local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local util = require "vim.lsp.util"

vim.diagnostic.config { virtual_text = false }

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local M = {}

M.config = function(client, bufnr)
  keymap("n", "<space>e", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)
  keymap("n", "<space>q", vim.diagnostic.setloclist, opts)

  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local vlsp = vim.lsp.buf

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap("n", "<leader>lD", vlsp.declaration, bufopts)
    keymap("n", "<leader>ld", vlsp.definition, bufopts)
    keymap("n", "K", vlsp.hover, bufopts)
    keymap("n", "<leader>li", vlsp.implementation, bufopts)
    keymap("n", "<C-k>", vlsp.signature_help, bufopts)
    keymap("n", "<leader>lt", vlsp.type_definition, bufopts)
    keymap("n", "<leader>lr", vlsp.rename, bufopts)
    keymap("n", "<leader>lc", vlsp.code_action, bufopts)
    keymap("n", "gr", vlsp.references, bufopts)
    keymap("n", "<leader>lf", vlsp.formatting, bufopts)

    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end

  return on_attach
end

return M
