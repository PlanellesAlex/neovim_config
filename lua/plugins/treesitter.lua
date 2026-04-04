return {
    {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',

	config = function()
	    local configs = require("nvim-treesitter.configs")
	    configs.setup({
		modules = {},
		sync_install = false,
		highlight = {
		    enable = true,
		    disable = {"c", "rust", "latex"}, -- disable
		    additional_vim_regex_highlighting = {
			"ruby",
		    } -- additional_vim_regex_highlighting
		}, -- highlight
		indent = { enable = true, disable = {"ruby"}}, -- indent
		autotage = { enable = true, }, -- autotage
		ignore_install = {"latex"},
		ensure_installed = {
		    "bash",
		    "c",
		    "cpp",
		    "python",
		    "diff",
		    "html",
		    "lua",
		    "luadoc",
		    "markdown",
		    "markdown_inline",
		    "query",
		    "vim",
		    "vimdoc",
		    "regex",
		    "json",
		    "jsonc",
		    "make",
		    "gitignore",
		    "just",
		}, -- ensure_installed
		auto_install = false,

		-- Gràcies a treesitter podem tenir incremental selection
		incremental_selection = {
		    enable = true,
		    keymaps = {
			init_selection = "<leader>sl",
			node_incremental = "<leader>s+",
			scope_incremental = "<leader>sc",
			node_decremental = "<leader>s-",
		    }, -- keymaps
		}, -- incremental_selection


	    }) -- require().setup({})
	end -- config = function()
    }, -- nvim-treesitter/nvim-treesitter


    {

	"nvim-treesitter/nvim-treesitter-textobjects",
	config = function()
	    require("nvim-treesitter.configs").setup({
		textobjects = {
		    select = {
			enable = true,

			-- automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
			    -- you can use the capture groups defined in textobjects.scm
			    ["af"] = "@function.outer",
			    ["if"] = "@function.inner",
			    ["ac"] = "@class.outer",
			    -- you can optionally set descriptions to the mappings (used in the desc parameter of
			    -- nvim_buf_set_keymap) which plugins like which-key display
			    ["ic"] = { query = "@class.inner", desc = "select inner part of a class region" },
			    -- you can also use captures from other query groups like `locals.scm`
			    ["as"] = { query = "@local.scope", query_group = "locals", desc = "select language scope" },
			},
			-- you can choose the select mode (default is charwise 'v')
			--
			-- can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'v', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
			    ['@parameter.outer'] = 'v', 
			    ['@function.outer'] = 'v', 
			    ['@class.outer'] = '<c-v>', 
			},
			-- if you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true or false
			include_surrounding_whitespace = false,
		    },
		},


	    }) -- require().setup({})

	end -- config = function()

    } -- nvim-treesitter/nvim-treesitter-textobjects




}
