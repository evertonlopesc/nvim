vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.cmd(':%s/\\s\\+$//e')
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')

    local brackets = { { '{', '}' } }
    npairs.add_rules({
      Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({
          brackets[1][1] .. brackets[1][2],
        }, pair)
      end),
    })
    for _, bracket in pairs(brackets) do
      npairs.add_rules({
        Rule(bracket[1] .. ' ', ' ' .. bracket[2])
          :with_pair(function()
            return false
          end)
          :with_move(function(opts)
            return opts.prev_char:match('.%' .. bracket[2]) ~= nil
          end)
          :use_key(bracket[2]),
      })
    end
  end,
})
