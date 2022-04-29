require('staline').setup {
	defaults = {
		left_separator  = "",
		right_separator = "",
		cool_symbol     = " ",       -- Change this to override defult OS icon.
		full_path       = false,
		mod_symbol      = "  ",
		lsp_client_symbol = " ",
		line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.

		fg              = "#000000",  -- Foreground text color.
		bg              = "#7a7a7a",     -- Default background is transparent.
		inactive_color  = "#001542",
		inactive_bgcolor = "none",
		true_colors     = false,       -- true lsp colors.
		font_active     = "none",     -- "bold", "italic", "bold,italic", etc
		branch_symbol   = " ",
	},
	mode_colors = {
		n = "#FFB86C",
		i = "#986fec",
		c = "#E27D60",
		v = "#4799EB",   -- etc..
	},
	mode_icons = {
		n = " ",
		i = " ",
		c = " ",
		v = " ",   -- etc..
	},
	sections = {
		left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
		mid  = { '%f%"' },
		right = { 'lsp_name', ' ','lsp',' ','cool_symbol','right_sep_double', '-line_column' },
	},
	special_table = {
		NvimTree = { 'NvimTree', ' ' },
		packer = { 'Packer',' ' },        -- etc
    Telescope = { 'Telescope', '' },
    Dashboard = { 'Deshboard', '' }
	},
	lsp_symbols = {
		Error=" ",
		Info=" ",
		Warn=" ",
		Hint="",
	},
}
