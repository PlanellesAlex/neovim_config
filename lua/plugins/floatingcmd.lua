return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",

    }, -- dependencies
    config = function()
	require("noice").setup({
	    lsp = {
                signature = {
                    enabled = true,  -- si poso true em surt un rectangle de la funció més explicatiu que 
				     -- el de lsp-signature.lua
                    auto_open = {
                        enabled    = true,
                        trigger    = true,
                        luasnip    = true,
                        throttle   = 50,
                    },
                },
                hover = {
		    -- enabled = true,
		    border = { style = "rounded" },
		    win_options = {
			winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
			filetype = { default = "markdown" },  -- força markdown per tots els lsp
		    },
                },
                override = {
                    -- fa servir noice per renderitzar la documentació LSP
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            }, -- lsp
	    views = {
                hover = {
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    }, -- border
                    win_options = {
                        winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
                    }, -- win_options
		    relative = "cursor",
		    position = {row = 2, col = 2},
		    size = {max_height = 8, max_width = 80},
                }, -- hover 
		signature = {
		    border = { style = "rounded" },
		    relative = "cursor",
		    position = {row = 2, col = 2},
		    size = {max_height = 8, max_width = 80},
		    win_options = {
			winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
		    }, -- win_options
                }, -- signature
                popup = {
                    border = {
                        style = "rounded",
                    }, -- border
		    relative = "cursor",
		    position = {row = 2, col = 2},
		    size = {max_height = 8, max_width = 80},
                    win_options = {
                        winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
                    }, -- win_options
                }, -- popup
                cmdline_popup = {
                    border = {
                        style = "rounded",
                    }, -- border
                    win_options = {
                        winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
                    }, -- win_options
                }, -- cmdline_popup
            }, -- views
	})-- require().setup()
    end -- config=function()

} -- return
