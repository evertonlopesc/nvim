vim.g.dashboard_custom_header = {
   '',
   '',
   '___________                    __',
   '\\_  _____/__  __ ____________/  |_  ____   ____',
   ' |    __)_\\  \\/ // __ \\_  __ \\   __\\/  _ \\ /    \\',
   ' |        \\   /\\  ___/|  | \\/|  | (  <_> )   |  \\',
   '/_______  / \\_/  \\___  >__|   |__|  \\____/|___|  /',
   '        \\/           \\/                        \\/',
   '',
}

vim.g.dashboard_custom_section = {
  a = { description = { '  New file                       ' }, command = 'enew' },
  b = { description = { '  Find file                 SPC ff' }, command = 'Telescope find_files' },
  c = { description = { '  Recent files              SPC fo' }, command = 'Telescope oldfiles' },
  d = { description = { '  Find Word                 SPC fg' }, command = 'Telescope live_grep' },
}

vim.g.dashboard_custom_footer = {
  '',
}
