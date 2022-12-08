local function lsp_server_name()
  local msg = "none"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end

  return msg
end

require("lualine").setup({
  options = {
    theme = "onedark",
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "filename", icon = " ", path = 1 } },
    lualine_c = { "%=", { lsp_server_name, icon = "" } },
    lualine_x = {},
    lualine_y = { "branch" },
    lualine_z = { "location", "%p%%/%L" },
  },
  inactive_sections = {
    lualine_c = { "%f %y %m" },
    lualine_x = {},
  },
  extensions = { "toggleterm", "neo-tree", "quickfix" },
  tabline = {
    lualine_a = { "%t %m%r%h" },
    lualine_b = { "diff" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "tabs" },
  },
})
