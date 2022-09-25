local neo = require("neotest")
local rspec = require("neotest-rspec")
local ldev = require("lua-dev")

ldev.setup({
	library = { plugins = { "neotest" }, types = true },
})

neo.setup({
	adapters = {
		rspec({}),
	},
})
