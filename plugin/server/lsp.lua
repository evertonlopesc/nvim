local msn = require("mason")
local msn_lspc = require("mason-lspconfig")
local lspc = require("lspconfig")
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local util = require("vim.lsp.util")

msn.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

vim.diagnostic.config({ virtual_text = false })

keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "<leader>ld", vim.lsp.buf.definition, bufopts)
  keymap("n", "<leader>lh", vim.lsp.buf.hover, bufopts)
  keymap("n", "<leader>li", vim.lsp.buf.implementation, bufopts)
  keymap("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
  keymap("n", "<leader>lt", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<leader>lr", vim.lsp.buf.rename, bufopts)
  keymap("n", "<leader>la", vim.lsp.buf.code_action, bufopts)
  keymap("n", "<leader>le", vim.lsp.buf.references, bufopts)
  keymap("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

msn_lspc.setup({
  ensure_installed = {
    "sumneko_lua",
  },

  automactic_installation = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspc.sumneko_lua.setup({
  settings = {
    lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lspc.tailwindcss.setup({
  filetypes = { "html", "eruby" },
})

local servers = msn_lspc.get_installed_servers()
for _, server in ipairs(servers) do
  lspc[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

keymap("n", "<leader>m", ":Mason<CR>", opts)
