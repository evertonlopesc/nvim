require'marks'.setup {
  default_mappings = false,
  builtin_marks = { ".", "<", ">", "^" },
  cyclic = true,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  excluded_filetypes = {},
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {
    set_next = 'mx',
    prev = 'mp',
    next = 'mn',
    delete_line = 'md',
    delete_buf = 'mdb'
  }
}
