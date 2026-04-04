return {
    {
	'nvim-lualine/lualine.nvim',
	dependencies = {
	    'nvim-tree/nvim-web-devicons',
	},
	opts = {
	    icons_enabled = true,
	    theme = "tokyonight",
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
	      refresh_time = 100,-- 16, -- ~60fps
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
	  },
	  extensions = {}
	}
}
