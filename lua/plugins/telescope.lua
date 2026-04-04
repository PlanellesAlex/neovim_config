return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 
	    'nvim-telescope/telescope-fzf-native.nvim',
	    build = 'make',
	    cond = function()
		return vim.fn.executable("make") == 1
	    end,

	},  -- "nvim-telescope/telescope-fzf-native.nvim
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    }, -- dependencies
    config = function()
	require("telescope").setup({
				pickers = {
					find_files = {
						-- theme = "ivy",
					}, -- find_files
				}, -- pickers
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					fzf = {},
				}, -- extensions
				defaults = {
					initial_mode = "insert",
					border = true,
					path_display = { "filename_first" },
				}, -- defaults
	}) -- require("telescope").setup

	pcall(require("telescope").load_extension, "fzf")
	pcall(require("telescope").load_extension, "ui-select")

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

	vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })

	vim.keymap.set("n", "<leader>sf", function()
	    builtin.find_files({
		winblend = 20,
		previewer = false,
	    })
	end, { desc = "[S]earch [F]iles" }) -- end keymap <leader>sf

	vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })

	vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

	vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })

	vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

	vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })

	vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

	vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

	vim.keymap.set("n", "<leader>/", function()
	    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
	    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 50,
		previewer = true,
		border = true,
		sorting_strategy = "ascending",
		layout_config = {
		    horizontal = {
			height = 0.5,
			preview_cutoff = 120,
			prompt_position = "top",
			width = 0.99,
		    }, -- end horizontal
		}, -- end layout_config
		layout_strategy = "horizontal",
	    }))
	end, { desc = "[/] Fuzzily search in current buffer" }) -- end keymap <leader>/

	vim.keymap.set("n", "<leader>-", function()
	    builtin.find_files(require("telescope.themes").get_ivy({
		winblend = 20,
		hidden = true,
		no_ignore = true,
		no_ignore_parent = true,
	    }))
	end, { desc = "Find Hidden Files" }) -- end keymap <leader>-

	vim.keymap.set("n", "<leader>s/", function()
	    builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	    })
	end, { desc = "[S]earch [/] in Open Files" }) -- end keymap <leader>s/

	-- Shortcut for searching your Neovim configuration files
	vim.keymap.set("n", "<leader>sn", function()
	    builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[S]earch [N]eovim files" })
    end, -- end config=function()
} -- return
