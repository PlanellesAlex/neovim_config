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
                    enabled = true,
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
	local p = require("config.colorpalette")


	vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",           { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder",      { fg = "#a200ff", bg = "NONE" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIcon",             { fg = "#a200ff", bg = "NONE" })
	vim.api.nvim_set_hl(0, "NoicePopup",                   { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NoicePopupBorder",             { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat",                  { bg = p.bg_float})
	vim.api.nvim_set_hl(0, "FloatBorder",                  { bg = p.bg_float, fg = p.cursor})
	vim.api.nvim_set_hl(0, "FloatTitle",  {bg = p.bg_float, fg = p.cursor})

    end -- config=function()

} -- return
