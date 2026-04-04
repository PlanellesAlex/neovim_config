local p = require("config.colorpalette")

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char      = "│",
            tab_char  = "│",
            highlight = "IblIndent",
        },
        scope = {
            enabled   = true,
            highlight = "IblScope",
	    show_start = false,
	    show_end = false,
        },
        exclude = {
            filetypes = { "help", "dashboard", "lazy", "mason", "notify" },
        },
    },
    config = function(_, opts)
        vim.api.nvim_set_hl(0, "IblIndent", { fg = p.purple_light })  -- línies apagades
        vim.api.nvim_set_hl(0, "IblScope",  { fg = p.purple })   -- scope actual lila
	vim.api.nvim_set_hl(0, "IblScopeUnderline1", {sp = p.purple, underdouble = true})
        require("ibl").setup(opts)
    end,
}
