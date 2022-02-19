require ("plugins")
require ("editor")
require ("mappings")

require'luasnip'.filetype_extend("ruby", {"rails"})

require('kommentary.config').use_extended_mappings()
