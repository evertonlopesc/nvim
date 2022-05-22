local bo = vim.bo
local fn = vim.fn

require('bufferline').setup {
  options = {
    mode = "buffers",
    numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    -- number_style = "superscript", -- | "subscript" | "" | { "none", "subscript" },
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      if buf.name:match('%.md') then
        return fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 18,
    tab_size = 18,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count) -- level, diagnostics_dict, context
      return "("..count..")"
    end,
    custom_filter = function(buf_number, buf_numbers)
      if bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      if fn.bufname(buf_number) ~= "<buffer-name-i-dont-want>" then
        return true
      end
      if fn.getcwd() == "<work-repo>" and bo[buf_number].filetype ~= "wiki" then
        return true
      end
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = {{filetype = "nvimtree", text = "file explorer", text_align = "left"}},
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thick", -- 'slant', 'padded_slant', 'thick', 'thin', { 'any', 'any' }
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id', function(buffer_a, buffer_b)
      return buffer_a.modified > buffer_b.modified
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "b", -- mandatory
          highlight = {gui = "underline", guisp = "red"}, -- optional
          priority = 2, -- determines where it will appear relative to other groups (optional)
          -- icon = "", -- optional
          matcher = function(buf) -- mandatory
            return buf.name:match('%.rb') or buf.name:match('%.lua')
          end,
        },
        {
          name = "t", -- mandatory
          highlight = {gui = "underline", guisp = "green"}, -- optional
          priority = 1, -- determines where it will appear relative to other groups (optional)
          -- icon = "", -- optional
          matcher = function(buf) -- mandatory
            return buf.name:match('%_test') or buf.name:match('%_spec.rb') or buf.name:match('%_spec')
          end,
        },
        {
          name = "f", -- mandatory
          highlight = {gui = "underline", guisp = "yellow"}, -- optional
          priority = 3, -- determines where it will appear relative to other groups (optional)
          -- icon = "", -- optional
          matcher = function(buf) -- mandatory
            return buf.name:match('%.html') or buf.name:match('%.js') or buf.name:match('%.css') or buf.name:match('%.vue') or buf.name:match('%.erb')
          end,
        },
        {
          name = "d", -- mandatory
          highlight = {gui = "underline", guisp = "gray"}, -- optional
          priority = 4, -- determines where it will appear relative to other groups (optional)
          -- icon = "", -- optional
          matcher = function(buf) -- mandatory
            return buf.name:match('%.md') or buf.name:match('%.txt')
          end,
        },
        {
          name = "docs",
          highlight = {gui = "undercurl", guisp = "green"},
          priority = 5, -- determines where it will appear relative to other groups (optional)
          auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.name:match('%.md') or buf.name:match('%.txt')
          end,
          separator = { -- optional
            style = require('bufferline.groups').separator.tab
          },
        }
      }
    }
  }
}
