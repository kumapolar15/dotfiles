local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

local devicons = require 'nvim-web-devicons'

bufferline.setup({
  options = {
    mode = 'tab',
    separator_style = 'thin',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icon = true,
    get_element_icon = function(element)
      local icon, hl = devicons.get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    show_buffer_icons = true,
  },
  highlights = {
    buffer_visible = {
      fg = '#84a0c6'
    },
    buffer_selected = {
      fg = '#d2d4de',
      bg = '#1e2132',
      bold = true,
      italic = false
    },
    separator = {
      fg = '#84a0c6'
    },
    separator_selected = {
      fg = '#d2d4de',
      bf = '#1e2132'
    },
  }
})

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
