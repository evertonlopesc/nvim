-- Emmet
vim.cmd[[
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,erb EmmetInstall
]]

vim.cmd[[
  let g:user_emmet_settings = {
  \  'variables': {'lang': 'ja'},
  \  'html': {
  \    'default_attributes': {
  \      'option': {'value': v:null},
  \      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
  \    },
  \    'snippets': {
  \      'html:5': "<!DOCTYPE html>\n"
  \              ."<html lang=\"${lang}\">\n"
  \              ."<head>\n"
  \              ."\t<meta charset=\"${charset}\">\n"
  \              ."\t<title></title>\n"
  \              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
  \              ."</head>\n"
  \              ."<body>\n\t${child}|\n</body>\n"
  \              ."</html>",
  \      'pe': "<%=  %>",
  \      'pc': "<%#  %>",
  \      'ps': "<%  %>",
  \      'if': "<% if condition %>\n"
  \              ." # code\n"
  \              ."<% else %>\n"
  \              ." # code\n"
  \              ."<% end %>\n",
  \      'linkto': "<%= link_to 'name', '#' %>",
  \      'pry': "<%= binding.pry %>",
  \    },
  \  },
  \}
]]
