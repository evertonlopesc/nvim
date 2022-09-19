local mason = require("mason")
local mason_lspc = require("mason-lspconfig")

local lspconfig = require('lspconfig')
local lsp_protocal = vim.lsp.protocol.make_client_capabilities()
local lsp_handlers = vim.lsp.handlers

local nl = require('null-ls')
local formatting = nl.builtins.formatting
local diagnostics = nl.builtins.diagnostics
local code_actions = nl.builtins.code_actions
local completion = nl.builtins.completion

local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

mason.setup({
        ui = {
                icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                }
        }
})

mason_lspc.setup({
        ensure_installed = {'sumneko_lua', 'solargraph', 'tsserver'},
        automatic_installation = true
})

local sources = {
        diagnostics.luacheck,
        diagnostics.rubocop,
        diagnostics.erb_lint,
        diagnostics.eslint,

        formatting.rubocop,
        formatting.erb_lint,
        formatting.prettierd,
        formatting.markdownlint,
        formatting.stylua.with({
                extra_args = function(params)
                        local cfg = vim.fn.stdpath("config") .. "/.stylua.toml"

                        if vim.fn.filereadable(params.root .. "/.stylua.toml") == 1 then
                                cfg = params.root .. "/.stylua.toml"
                        elseif vim.fn.filereadable(params.root .. "/stylua.toml") == 1 then
                                cfg = params.root .. "/stylua.toml"
                        end

                        return { "--config-path", cfg }
                end,
        }),

        code_actions.eslint,
        completion.luasnip
}

keymap('n', '<leader>lp', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>lsl', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local bufopts = {noremap = true, silent = true, buffer = bufnr}

        keymap('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
        keymap('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
        keymap('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
        keymap('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
        keymap('n', '<leader>ltd', vim.lsp.buf.type_definition, bufopts)
        keymap('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
        keymap('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
        keymap('n', '<leader>le', vim.lsp.buf.references, bufopts)
        keymap('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePost", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                vim.lsp.buf.formatting_sync()
                        end,
                })
        end
end

local capabilities = lsp_protocal
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

nl.setup({ sources = sources })
