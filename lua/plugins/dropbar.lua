local p = require("config.colorpalette")

return {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    config = function()
        require("dropbar").setup({
            icons = {
                enable = true,
            },
            bar = {
                hover = true,
            },
        })

        -- Colors del breadcrumb
        vim.api.nvim_set_hl(0, "DropBarCurrentContext", { fg = p.purple,    bold = true })
        vim.api.nvim_set_hl(0, "DropBarMenuCurrentContext", { fg = p.purple })
        vim.api.nvim_set_hl(0, "DropBarIconKindFunction",  { fg = p.cyan })
        vim.api.nvim_set_hl(0, "DropBarIconKindMethod",    { fg = p.cyan })
        vim.api.nvim_set_hl(0, "DropBarIconKindClass",     { fg = p.yellow })
        vim.api.nvim_set_hl(0, "DropBarIconKindModule",    { fg = p.yellow })
        vim.api.nvim_set_hl(0, "DropBarMenuNormalFloat",   { bg = p.bg_float })
        vim.api.nvim_set_hl(0, "DropBarMenuFloatBorder",   { fg = p.cursor, bg = p.bg_float })
    end,
}
