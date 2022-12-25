vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd(":%s/\\s\\+$//e")
  end
})
