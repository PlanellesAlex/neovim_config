local p = require("config.colorpalette")

return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("aerial").setup({
            -- Fa servir LSP primer, treesitter com a fallback
            backends = { "lsp", "treesitter", "markdown", "man" },

            layout = {
                max_width    = { 40, 0.2 },
                width        = nil,
                min_width    = 20,
                default_direction = "right",  -- obre a la dreta com neo-tree
                placement    = "window",
            },

            -- Tanca aerial si és l'última finestra
            close_automatic_events = { "unsupported" },

            -- Mostra el símbol actual a la statusline (integrat amb lualine)
            show_guides = true,

            -- Filtra per tipus de símbol (mostra tot per defecte)
            filter_kind = {
                "Class",
                "Constructor",
                "Enum",
                "Function",
                "Interface",
                "Module",
                "Method",
                "Struct",
            },

            -- Highlight del símbol actual
            highlight_on_hover  = true,
            highlight_on_jump   = 300,

            -- Autosalt al símbol més proper al cursor
            autojump = true,

            -- Integració amb telescope per buscar símbols
            telescope = {
                col_offset = 0,
            },
        })

        -- Colors
        vim.api.nvim_set_hl(0, "AerialLine",       { bg = p.bg_float_sel, bold = true })
        vim.api.nvim_set_hl(0, "AerialNormal",     { bg = p.bg_float })
        vim.api.nvim_set_hl(0, "AerialGuide",      { fg = p.fg_dim })
        vim.api.nvim_set_hl(0, "AerialClass",      { fg = p.yellow })
        vim.api.nvim_set_hl(0, "AerialFunction",   { fg = p.cyan })
        vim.api.nvim_set_hl(0, "AerialMethod",     { fg = p.cyan })
        vim.api.nvim_set_hl(0, "AerialModule",     { fg = p.yellow })
        vim.api.nvim_set_hl(0, "AerialStruct",     { fg = p.yellow })

        -- Keymaps
        vim.keymap.set("n", "<leader>cf", "<cmd>AerialToggle<CR>",
            { desc = "[C]ode [F]unctions (aerial)" })
        vim.keymap.set("n", "<leader>cn", "<cmd>AerialNext<CR>",
            { desc = "[C]ode [N]ext symbol" })
        vim.keymap.set("n", "<leader>cp", "<cmd>AerialPrev<CR>",
            { desc = "[C]ode [P]rev symbol" })

        -- Integració amb telescope: busca símbols amb fuzzy
        vim.keymap.set("n", "<leader>cs", "<cmd>Telescope aerial<CR>",
            { desc = "[C]ode [S]ymbols (telescope)" })
    end,
}
