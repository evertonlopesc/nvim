local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'
require('luasnip/loaders/from_vscode').lazy_load()

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

cmp.setup {
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      maxwidth = 50,
      menu = {
        nvim_lsp  = '[LSP]',
        luasnip   = '[LuaSnip]',
        nvim_lua  = '[Lua]',
        path      = '[PATH]',
        buffer    = '[BUFFER]',
      }
    }
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
  }),

  mapping = {
    ['<C-d>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>']     = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>']     = cmp.mapping({
      i           = cmp.mapping.abort(),
      c           = cmp.mapping.close(),
    }),
    ['<CR>']      = cmp.mapping.confirm({ select = true }),

    ["<TAB>"]     = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-TAB>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  snippet = {
    expand = function(args)
      if not luasnip then
        return
      end
      luasnip.lsp_expand(args.body)
    end,
  },
}
