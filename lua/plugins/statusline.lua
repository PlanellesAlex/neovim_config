local p = require("config.colorpalette")

local lualine_theme = {
  normal = {
    a = { bg = p.statusline_mode_bg,     fg = p.statusline_mode_fg, gui = "bold" },
    b = {bg = p.statusline_filename_bg , fg = p.statusline_filename_fg },
    c = { bg = p.statusline_info_bg,     fg = p.statusline_info_fg },

    x = { bg = p.statusline_info_bg,     fg = p.statusline_info_fg },
    y = {bg = p.statusline_filename_bg , fg = p.statusline_filename_fg },
    z = { bg = p.statusline_mode_bg,     fg = p.statusline_mode_fg, gui = "bold" },
  },

  insert  = {
	a = { bg = p.insert_mode_bg, fg = p.insert_mode_fg, gui = "bold" },
	b = { bg = p.insert_filename_bg, fg = p.insert_filename_fg},
},
  visual  = {
	a = { bg = p.visual_mode_bg, fg = p.visual_mode_fg, gui = "bold" },
	b = { bg = p.visual_filename_bg, fg = p.visual_filename_fg},
},
  replace = {
	a = { bg = p.replace_mode_bg, fg = p.replace_mode_fg, gui = "bold" },
	b = { bg = p.replace_filename_bg, fg = p.replace_filename_fg},
},
  command = {
	a = { bg = p.command_mode_bg, fg = p.command_mode_fg, gui = "bold" },
	b = { bg = p.command_filename_bg, fg = p.command_filename_fg},
},
  --
  inactive = {
    a = { bg = p.statusline_filename_bg, fg = p.statusline_info_fg },
    b = { bg = p.statusline_filename_bg, fg = p.statusline_info_fg },
    c = { bg = p.statusline_info_bg,     fg = p.statusline_info_fg },

    x = { bg = p.statusline_info_bg,     fg = p.statusline_info_fg },
    y = { bg = p.statusline_filename_bg, fg = p.statusline_info_fg },
    z = { bg = p.statusline_filename_bg, fg = p.statusline_info_fg },
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = lualine_theme,
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 100,
            events = {
              'WinEnter',
              'BufEnter',
              'BufWritePost',
              'SessionLoadPost',
              'FileChangedShellPost',
              'VimResized',
              'Filetype',
              'CursorMoved',
              'CursorMovedI',
              'ModeChanged',
            },
          },
        },

        sections = {
          lualine_a = {'mode'},
          lualine_b = {{'filename', path = 0}},
          lualine_c = {'branch', 'diff', 'diagnostics'},
          lualine_x = {'lsp_status', 'fileformat','filetype'},
          lualine_y = {{ "datetime", style = "%H:%M" }},
          lualine_z = {'progress'}
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {{'filename', path = 1 }},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },

        extensions = {}
      })
    end
  }
}
