-- aixo no es mes que un fitxer per sobreescriure els colors de tokyionight 
-- i poder tenir les coses liles.
-- Tambe es el fiter on posos que el colorscheme que vulle s tokyionight


local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", {bg="none"})
    -- Enable transparent background (only for neovim NOT neovide)
end
local p = require("config.colorpalette")


return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                on_highlights = function(hl, _)
                    hl.NormalFloat = { bg = p.bg_float }
                    hl.FloatBorder = { fg = p.cursor, bg = p.bg_float }
                    hl.FloatTitle  = { fg = p.cursor, bg = p.bg_float }
                end,
            })
            vim.cmd.colorscheme "tokyonight"


            vim.api.nvim_create_autocmd("VimEnter", {
                once = true,
                callback = function()
                    vim.api.nvim_set_hl(0, "NormalFloat",          { bg = p.bg_float })
                    vim.api.nvim_set_hl(0, "FloatBorder",          { fg = p.cursor, bg = p.bg_float })
                    vim.api.nvim_set_hl(0, "FloatTitle",           { fg = p.cursor, bg = p.bg_float })
                    vim.api.nvim_set_hl(0, "NeoTreeNormal",        { bg = p.bg_float })
                    vim.api.nvim_set_hl(0, "NeoTreeNormalNC",      { bg = p.bg_float })
                    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator",  { fg = p.cursor, bg = p.bg_float })
                    vim.api.nvim_set_hl(0, "NeoTreeRootName",      { fg = p.cursor, bold = true })
                    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = p.lavender })
                    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = p.purple })
                    vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened",{ fg = p.cursor, bold = true })
                    -- Telescope
                    vim.api.nvim_set_hl(0, "TelescopeBorder",         { fg = p.cursor })
                    vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { fg = p.cursor })
                    vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { fg = p.cursor })
                    vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { fg = p.cursor })
                    vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = p.cursor })
                    vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = p.cursor, bold = true })
		    vim.api.nvim_set_hl(0, "ToggleTermNormal",       { bg = p.bg_float })
                    vim.api.nvim_set_hl(0, "ToggleTermBorder",       { fg = p.cursor,   bg = p.bg_float })
		    for i = 1, 10 do
                        vim.api.nvim_set_hl(0, "ToggleTerm" .. i .. "NormalFloat", { bg = p.bg_float })
                        vim.api.nvim_set_hl(0, "ToggleTerm" .. i .. "FloatBorder", { fg = p.cursor, bg = p.bg_float })
                    end
                end,
            })
        end,
    },
}
