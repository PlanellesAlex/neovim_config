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
        require("ibl").setup(opts)
    end,
}
