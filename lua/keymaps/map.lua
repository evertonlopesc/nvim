M = {}

function M.keymap(mode, key, command, desc, expr)
  vim.keymap.set(
    mode,
    key,
    command,
    { desc = desc, expr = expr, noremap = true, silent = true }
  )
end

function M.normal(key, command, desc, expr)
  desc = desc or 'N/A'
  expr = expr or false

  M.keymap('n', key, command, desc, expr)
end

function M.visual(key, command, desc, expr)
  expr = expr or false
  desc = desc or 'N/A'

  M.keymap('v', key, command, desc, expr)
end

function M.select(key, command, desc, expr)
  expr = expr or false
  desc = desc or 'N/A'

  M.keymap('x', key, command, desc, expr)
end

function M.insert(key, command, desc, expr)
  expr = expr or false
  desc = desc or 'N/A'

  M.keymap('i', key, command, desc, expr)
end

return M
