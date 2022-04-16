require ("bootstrap")
require ("plugins")
require ("mappings")

-- Extension
require ('kommentary.config').use_extended_mappings()
require ('luasnip').filetype_extend("ruby", {"rails"})
