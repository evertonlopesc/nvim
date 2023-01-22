local M = {
  event = 'BufReadPost',
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-buffer',
    'onsails/lspkind-nvim',
  },
  config = function()
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
        and vim.api
            .nvim_buf_get_lines(0, line - 1, line, true)[1]
            :sub(col, col)
            :match('%s')
          == nil
    end

    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    require('luasnip/loaders/from_vscode').lazy_load()

    cmp.setup({
      window = {
        documentation = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
        completion = {
          border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
          winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
        },
      },
      formatting = {
        fields = { 'abbr', 'kind' },
        format = lspkind.cmp_format({
          with_text = true,
          maxwidth = 50,
          menu = {
            luasnip = '[LuaSnip]',
            nvim_lsp = '[LSP]',
            buffer = '[BUFFER]',
            nvim_lua = '[Lua]',
            path = '[PATH]',
          },
        }),
      },

      sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'path' },
      }),

      mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<c-n>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<c-p>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },

      snippet = {
        expand = function(args)
          if not luasnip then
            return
          end
          luasnip.lsp_expand(args.body)
        end,
      },
    })
  end,
  init = function()
    vim.opt.pumheight = 10
    vim.opt.completeopt = 'menu,menuone,noselect'
  end,
}

return M
