local db = require "dashboard"

db.custom_header = {
  "",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡟⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⡛⠕⢌⢊⢆⠣⡘⢌⢆⢊⢎⠫⡻⢩⢛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡍⡫⡹⠫⡋⢇⠕⢌⠜⢌⠆⢆⢣⢑⠕⡐⡔⠢⡑⢜⡐⠕⡌⡢⠍⢏⢝⢙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢃⠪⡢⠱⡨⡂⡣⡑⢅⠣⡑⡑⡌⡢⡑⢅⢊⢆⠪⡂⢎⠮⣂⡪⡘⢔⢑⠔⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠢⢑⢘⠌⢆⢪⢐⢄⢈⠈⠌⢆⢒⢌⢪⠨⡢⡡⠁⡐⡠⠢⡢⢱⠘⠌⠔⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⡔⠄⢀⢁⢥⣂⡑⠔⢅⠕⠄⢑⢑⢌⢢⢑⠌⠠⠣⡑⢌⢊⢄⣕⠁⠁⠄⡪⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⠱⡑⢌⢆⠄⡈⠳⠜⠊⠈⠠⠑⠁⢌⢢⠱⡨⠢⡁⠨⠑⠈⢀⠸⠲⠎⠃⡀⢕⢌⠢⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢅⠂⡪⢨⠢⡡⢃⢆⢒⢌⢪⢑⢕⢘⢌⢢⠡⠱⡘⡨⢢⠱⡘⠌⢆⢕⢑⠔⡇⡊⢆⠪⡨⢂⢂⢙⢿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠫⡐⡐⡑⡌⡢⡑⣘⢐⢌⢢⠱⡐⢕⠰⡑⢌⠢⡃⢇⢪⠨⡢⡑⡢⡃⢆⠕⡌⡪⢸⠨⡢⢑⢌⠆⡅⡂⡺⠮⡓⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢑⠌⡐⠄⡣⡊⡢⠡⠢⠑⢌⠢⡱⠘⠌⠊⢈⠈⠠⠈⠐⠁⡀⠂⠁⠌⠘⠐⠕⠌⠜⠸⢈⠂⠑⡔⢑⡬⣔⣖⣟⢾⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠫⢐⠡⡈⡢⠑⠄⠕⡌⡪⡀⠂⠠⠄⠄⡐⡀⡨⢠⠰⢐⠌⢄⠡⠰⡐⢅⠔⢄⢂⢀⠂⢈⠘⠂⢁⢑⠔⢔⠨⢂⠅⡊⡋⠣⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠨⠨⡂⢅⢂⠢⠡⡡⠑⡈⢆⠪⢪⢘⢌⢊⢢⢑⢌⢢⠑⡁⡡⡁⣁⠁⢊⠢⡑⢕⢌⢢⢑⠱⡐⢅⢣⠡⢃⢂⠪⢐⠌⠢⢨⠨⢂⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢌⠊⠔⡐⡐⡡⢑⢐⠡⠨⡂⢮⣆⡑⢌⢊⠆⢕⢌⠢⡒⢔⠢⡠⡐⢍⠢⡢⡊⢆⠕⢔⠅⡣⢑⣥⡖⠅⡢⢐⠡⡂⠅⢅⠕⠨⡐⠡⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⡿⣜⣟⢿⣿⣿⠿⢋⠔⠨⡠⠡⡑⡐⢌⢐⠰⢐⠡⢑⢐⠘⣿⣳⡀⠂⠅⡑⡐⠅⠣⠡⡃⠎⠜⢌⢊⢂⢊⠂⠅⠅⠂⣠⣾⠾⡁⢅⠢⡁⠢⡂⢅⠑⠌⢌⠂⡅⢅⢊⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣶⡹⡵⣛⢋⠌⠢⡘⠨⡐⠡⢂⠊⠔⡐⢈⢐⠨⡐⡐⠅⢌⢻⡿⣶⣀⠂⡂⢅⠑⢅⠢⠡⡑⡐⡐⡐⠄⠅⠅⣢⡾⣿⢝⠡⢂⠅⡂⡢⠑⢀⠢⠡⡑⠡⢊⢐⠔⡐⠌⠜⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣷⣭⠐⠄⠌⠈⠐⠡⠨⠨⢂⠅⠕⡨⠄⢐⣰⠴⣌⠌⡂⡂⣽⣿⢝⠄⢕⠐⢅⢆⠪⡐⡐⢔⢌⠢⢑⢑⠈⢯⡿⣏⢐⠌⠔⡬⠦⣔⡈⢐⠨⡈⡢⠡⡑⠐⠌⠐⠁⢁⢈⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠂⡀⢁⠈⢀⠐⠈⢀⠨⢈⠔⡁⠸⠵⡹⠜⡐⠔⣰⣿⠾⡈⢆⠔⢄⠕⢰⢑⢌⠪⡢⠊⡢⢠⢠⢐⢑⡿⣟⡆⠌⢌⠣⢫⢮⠇⢐⠡⠂⠂⠁⠄⠂⠐⠄⠁⡀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⢁⠠⠄⠄⠐⠄⡀⠂⠄⡐⡐⠄⠠⢀⠢⢂⠕⡈⡂⣾⣟⠇⠔⠁⡅⠥⠁⠄⡣⠪⡨⠪⡀⠘⡄⠅⠊⠢⡸⣿⣧⠡⡑⠨⢂⠢⢐⠄⡀⢕⠄⠂⢁⠄⠂⠁⠄⠠⠄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⡿⠋⠂⠐⠄⠄⠂⠐⠈⡀⠠⠄⡱⠨⠄⠌⠠⡑⡈⡢⠨⡐⢸⣯⡿⠨⡢⠱⢈⡈⢄⠪⡘⡌⡪⡘⠔⢄⢈⠊⢆⢆⠪⢳⣿⡔⠨⠨⢂⢑⠐⡁⢀⠐⡱⡈⠄⠄⢈⠄⠂⠐⠄⡁⢀⠙⠿⣿⣿⣿⣿⣿⣿⣿",
  "⣿⣿⣿⣿⣿⠋⡀⠄⠁⡈⠠⠐⠈⠄⡁⠠⠐⡐⠅⢁⠐⠄⢁⠄⡐⢐⠡⠨⣾⢯⢇⠣⡊⡪⡂⢎⠜⢌⢢⠱⡐⡅⡍⡪⢢⠩⡢⠪⡘⠜⣯⣧⠡⠡⠁⠄⠂⠄⠄⠠⠐⢘⠄⠐⢀⠄⢁⠈⢀⠠⠄⠄⠂⠈⢻⣿⣿⣿⣿⣿",
  "⣿⣿⣿⡿⠁⠄⠠⠄⠂⠠⠄⠐⠈⡀⠄⠄⢂⠪⢘⠐⢌⠢⠠⠐⠄⡁⢊⣸⣽⡟⠰⡡⡃⡪⡨⡂⢇⠕⢅⠕⡌⢆⠕⡌⢆⠣⡊⡪⡨⡑⢻⣽⡔⢁⠁⠂⢁⢐⠐⢅⢊⠢⢑⠈⡀⠄⠂⡀⠄⠄⠂⠠⠈⠄⠄⠹⣿⣿⣿⣿",
  "⣿⣿⡟⢁⠐⠄⠂⡀⢁⠐⠈⡀⠁⠠⠄⡁⠬⢈⢂⠕⢄⢑⠄⠌⠄⠄⡰⣕⢿⢹⣻⣻⢶⢷⣶⣧⣧⣥⣥⣥⣬⣦⣵⣼⣶⣷⣾⠶⣟⣟⣏⢯⢳⡀⠄⠁⠂⠐⡨⢂⠢⢑⢈⠢⠄⠐⢀⠠⠄⢁⠈⠄⠂⢁⠄⠂⠘⢿⣿⣿",
  "⣿⡟⠄⢄⠄⢈⠄⢄⠠⠐⠄⢄⠊⠠⠄⢌⠊⢔⠐⢌⢐⢐⠠⠄⡡⣪⢳⢕⡣⡫⢯⡻⡻⡿⡷⣷⣷⣷⣿⡿⣿⣾⣾⣶⡷⡷⣟⢟⢯⡫⢞⡜⢵⡹⣢⣁⠈⢐⠨⡐⠌⡂⠢⢑⠌⠄⠄⠢⡈⠄⠄⢁⠈⡀⠄⠨⡀⠈⢿⣿",
  "⣿⣇⠪⠂⠠⠠⡢⠁⠠⡐⢜⢈⠄⢂⠜⠠⡊⠄⠕⡐⡐⠅⡔⡮⡹⣜⠕⢵⢽⡹⣕⣗⢽⢜⣜⢖⣒⡲⣲⡪⣖⢮⢲⢕⢗⣹⢬⢵⡲⡽⣕⢯⡣⠝⡼⡜⡮⡢⢁⠢⢑⠨⠨⢐⠨⠢⠐⢀⠑⢔⢀⠄⠑⡄⠄⡀⢊⢢⢱⣿",
  "⣿⣧⠃⡅⡪⡑⠄⢔⢑⠌⡂⡢⢢⢑⠡⡁⡢⢑⠨⢐⢈⠢⡱⣝⢚⠐⢌⠢⠨⡨⢃⠓⠽⠵⢭⡳⡵⡽⡼⣜⢵⡺⣕⢯⡳⡳⠽⠕⠏⡓⡉⢅⠌⢌⠌⡪⡳⡅⡑⠌⡐⡨⠨⡐⡐⠡⢃⠆⡅⡑⢌⠢⡁⢈⢎⠢⡐⢌⢺⣿",
  "⣿⣿⡐⢌⢆⢊⠪⡊⡂⣵⡄⡊⠆⠅⡂⡢⡈⠢⠨⢂⢂⠢⢑⢁⠢⢑⠐⠌⢌⠂⢅⠪⢐⠡⠡⡐⡐⡡⠡⡑⢅⠣⢑⢐⠄⢕⠨⠨⢂⢂⠪⢐⠨⢂⠌⠢⢈⢂⢂⠅⡢⢈⢂⠢⠨⠨⢐⢑⢌⢻⣔⠨⡊⢆⠢⠱⡘⠠⣿⣿",
  "⣿⣿⣇⠕⢔⠨⡊⠢⣾⠿⢣⢑⠑⠁⢂⠢⠨⠨⡨⢂⠢⢑⢐⢐⠌⠄⢅⠑⠄⢕⠐⠌⡂⢅⢑⢐⢐⠌⠌⡂⠅⡊⠔⡐⠅⡂⠪⡈⡂⠢⡑⠄⡑⢄⠑⠌⡂⡂⡢⢁⠢⡁⡢⠡⠡⠡⠑⠠⢑⠼⢿⣦⢊⠢⡃⢅⠣⣹⣿⣿",
  "⣿⣿⣿⡘⢄⢕⢘⠈⠁⠄⠁⠄⡀⠐⠄⢀⠈⠈⠄⠁⠈⠐⢐⠠⠡⠡⡑⠨⢨⣽⣿⣿⣶⣶⣦⣦⣢⣡⠑⠄⢕⢈⣢⣈⣆⣮⣦⣶⣾⣾⣯⡂⢌⠂⢅⢑⢐⠐⠈⠄⠁⡀⠄⢁⠠⠄⠠⠄⠄⠊⠄⠈⠠⢑⢌⢐⠅⣿⣿⣿",
  "⣿⣿⡿⠨⡐⢅⠅⠄⠂⠁⠄⠁⢀⠠⠈⠄⠄⠂⢁⠄⠅⢔⢐⣡⣡⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣔⣐⡐⡐⠄⡁⡀⠠⠐⠄⢀⠠⠄⠂⠁⢀⠈⠠⠠⠁⠆⡂⠕⢿⣿⣿",
  "⣿⣯⣮⡦⡢⡁⡂⡂⡂⠂⠁⠠⢀⠠⠠⢨⣐⣅⣦⣵⣷⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⣶⣬⣔⣐⠄⢄⢀⠠⠄⠂⠄⠄⡐⡨⢐⢁⢲⣥⣧⣽⣿",
  "⣿⣿⣭⣶⣴⣴⣐⣔⣬⣬⣾⣾⣾⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⣷⣥⣵⣴⣰⣠⣣⣦⣵⣬⣿⣿⣿",
  "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  "",
}

db.hide_statusline = false
db.hide_tabline = false
db.hide_winbar = false

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

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>a", ":Dashboard<CR>", opts)
