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

--[[
  mx              Set mark x
  m,              Set the next available alphabetical (lowercase) mark
  m;              Toggle the next available mark at the current line
  dmx             Delete mark x
  dm-             Delete all marks on the current line
  dm<space>       Delete all marks in the current buffer
  m]              Move to next mark
  m[              Move to previous mark
  m:              Preview mark. This will prompt you for a specific mark to
                  preview; press <cr> to preview the next mark.

  m[0-9]          Add a bookmark from bookmark group[0-9].
  dm[0-9]         Delete all bookmarks from bookmark group[0-9].
  m}              Move to the next bookmark having the same type as the bookmark under
                  the cursor. Works across buffers.
  m{              Move to the previous bookmark having the same type as the bookmark under
                  the cursor. Works across buffers.
  dm=             Delete the bookmark under the cursor.
]]
