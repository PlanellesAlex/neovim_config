return {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp" },
    config = function()
        local p = require("config.colorpalette")

        require("clangd_extensions").setup({
            inlay_hints = {
                inline          = true,   -- mostra hints inline al codi
                only_current_line = false,
                show_parameter_hints = true,  -- mostra el nom del paràmetre en les crides
                parameter_hints_prefix = "← ",
                other_hints_prefix     = "» ",
            },
            ast = {
                role_icons = {
                    type            = "",
                    declaration     = "󰠱",
                    expression      = "󰉿",
                    specifier       = "󰦪",
                    statement       = "󰜴",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound      = "",
                    Recovery      = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm  = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject  = "",
                },
            },
            memory_usage = {
                border = "rounded",
            },
            symbol_info = {
                border = "rounded",
            },
        })

        -- Colors dels inlay hints
        vim.api.nvim_set_hl(0, "LspInlayHint", { fg = p.fg_dim, italic = true })

        -- Keymaps
        vim.keymap.set("n", "<leader>ch", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "[C]langd inlay [H]ints toggle" })

        vim.keymap.set("n", "<leader>ct", "<cmd>ClangdTypeHierarchy<CR>",
            { desc = "[C]langd [T]ype hierarchy" })

        vim.keymap.set("n", "<leader>cm", "<cmd>ClangdMemoryUsage<CR>",
            { desc = "[C]langd [M]emory usage" })

        vim.keymap.set("n", "<leader>cs", "<cmd>ClangdSymbolInfo<CR>",
            { desc = "[C]langd [S]ymbol info" })
    end,
}
