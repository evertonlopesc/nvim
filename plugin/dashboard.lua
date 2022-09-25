local db = require("dashboard")

db.custom_center = {
	{
		icon = " ",
		desc = "New file                 ",
		shortcut = "enter",
		action = "enew",
	},
	{
		icon = " ",
		desc = "Find file              ",
		shortcut = "SPC f f",
		action = "Telescope find_files",
	},
	{
		icon = " ",
		desc = "Recent Files           ",
		shortcut = "SPC f o",
		action = "Telescope oldfiles",
	},
	{
		icon = " ",
		desc = "Find word              ",
		shortcut = "SPC f g",
		action = "Telescope live_grep",
	},
}
