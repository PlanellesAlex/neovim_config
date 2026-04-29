-- aixo no es mes que un fitxer per sobreescriure els colors de tokyionight 
-- i poder tenir les coses liles.
-- Tambe es el fiter on posos que el colorscheme que vulle s tokyionight

local p = require("config.colorpalette")

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                on_highlights = function(hl, _)

                    hl.Cursor   = { fg = p.bg, bg = p.cursor }
                    hl.lCursor  = { fg = p.bg, bg = p.cursor }
                    hl.CursorIM = { fg = p.bg, bg = p.cursor }
                    -- -- ── Cursor ────────────────────────────────────────────
                    -- hl.Cursor    = { fg = p.bg, bg = p.cursor }
                    -- hl.lCursor   = { fg = p.bg, bg = p.cursor }
                    -- hl.CursorIM  = { fg = p.bg, bg = p.cursor }
                    --
                    -- -- ── Floating windows (base) ───────────────────────────
                    -- hl.NormalFloat   = { bg = p.bg_float }
                    -- hl.FloatBorder   = { fg = p.cursor, bg = p.bg_float }
                    -- hl.FloatTitle    = { fg = p.cursor, bg = p.bg_float }
                    -- hl.FloatFooter   = { fg = p.cursor, bg = p.bg_float }
                    --
                    -- -- ── LSP hover / signature ─────────────────────────────
                    -- hl.LspInfoBorder              = { fg = p.cursor, bg = p.bg_float }
                    -- hl.LspHoverNormal             = { bg = p.bg_float }
                    -- hl.LspHoverBorder             = { fg = p.cursor, bg = p.bg_float }
                    -- hl.LspSignatureActiveParameter = { fg = p.cursor, bold = true, underline = true }
                    --
                    -- -- ── Noice ─────────────────────────────────────────────
                    -- hl.NoicePopup              = { bg = p.bg_float }
                    -- hl.NoicePopupBorder        = { fg = p.cursor, bg = p.bg_float }
                    -- hl.NoiceLspDocBorder       = { fg = p.cursor, bg = p.bg_float }
                    -- hl.NoiceLspDoc             = { bg = p.bg_float }
                    -- hl.NoiceSignatureBorder    = { fg = p.cursor, bg = p.bg_float }
                    -- hl.NoiceSignature          = { bg = p.bg_float }
                    -- hl.NoiceCmdlinePopup       = { bg = p.none }
                    -- hl.NoiceCmdlinePopupBorder = { fg = p.cursor, bg = p.none }
                    -- hl.NoiceCmdlineIcon        = { fg = p.cursor }
                    --
                    -- -- ── nvim-cmp ──────────────────────────────────────────
                    -- hl.CmpNormal    = { bg = p.bg_float }
                    -- hl.CmpBorder    = { fg = p.cursor,        bg = p.bg_float }
                    -- hl.CmpDocBorder = { fg = p.purple_bright, bg = p.bg_float }
                    -- hl.CmpSel       = { fg = p.white,         bg = p.bg_float_sel, bold = true }
                    -- hl.CmpItemAbbrMatch      = { fg = p.purple, bold = true }
                    -- hl.CmpItemAbbrMatchFuzzy = { fg = p.purple_bright }
                    -- hl.CmpItemMenu           = { fg = p.fg_dim, italic = true }
                    -- hl.CmpItemKindFunction   = { fg = p.cyan }
                    -- hl.CmpItemKindMethod     = { fg = p.cyan }
                    -- hl.CmpItemKindClass      = { fg = p.yellow }
                    -- hl.CmpItemKindModule     = { fg = p.yellow }
                    -- hl.CmpItemKindVariable   = { fg = p.purple }
                    -- hl.CmpItemKindKeyword    = { fg = p.purple_bright }
                    -- hl.CmpItemKindSnippet    = { fg = p.lavender }
                    -- hl.CmpItemKindText       = { fg = p.fg }
                    --
                    -- -- ── Telescope ─────────────────────────────────────────
                    -- hl.TelescopeBorder        = { fg = p.cursor }
                    -- hl.TelescopePromptBorder  = { fg = p.cursor }
                    -- hl.TelescopeResultsBorder = { fg = p.cursor }
                    -- hl.TelescopePreviewBorder = { fg = p.cursor }
                    -- hl.TelescopeSelectionCaret = { fg = p.cursor }
                    -- hl.TelescopeMatching      = { fg = p.cursor, bold = true }
                    --
                    -- -- ── Neo-tree ──────────────────────────────────────────
                    -- hl.NeoTreeNormal         = { bg = p.bg_float }
                    -- hl.NeoTreeNormalNC       = { bg = p.bg_float }
                    -- hl.NeoTreeWinSeparator   = { fg = p.cursor, bg = p.bg_float }
                    -- hl.NeoTreeRootName       = { fg = p.cursor, bold = true }
                    -- hl.NeoTreeDirectoryName  = { fg = p.lavender }
                    -- hl.NeoTreeDirectoryIcon  = { fg = p.purple }
                    -- hl.NeoTreeFileNameOpened = { fg = p.cursor, bold = true }
                    --
                    -- -- ── Toggleterm ────────────────────────────────────────
                    -- for i = 1, 10 do
                    --     hl["ToggleTerm" .. i .. "NormalFloat"] = { bg = p.bg_float }
                    --     hl["ToggleTerm" .. i .. "FloatBorder"] = { fg = p.cursor, bg = p.bg_float }
                    -- end
                    --
                    -- -- ── Which-key ─────────────────────────────────────────
                    -- hl.WhichKeyFloat  = { bg = p.bg_float }
                    -- hl.WhichKeyBorder = { fg = p.cursor, bg = p.bg_float }
                    --
                    -- -- ── Aerial ────────────────────────────────────────────
                    -- hl.AerialNormal = { bg = p.bg_float }
                    -- hl.AerialLine   = { bg = p.bg_float_sel, bold = true }

                end,
            })

            vim.cmd.colorscheme "tokyonight"

            vim.opt.guicursor = {
                "n-sm:block-Cursor",
                "i-ci-ve:ver25-Cursor",
                "r-cr:hor20-Cursor",
                "o:hor50-Cursor",
                "v:block-Cursor",
                "t:block-Cursor",
            }
        end,
    },
}


















-- local function enable_transparency()
--     vim.api.nvim_set_hl(0, "Normal", {bg="none"})
--     -- Enable transparent background (only for neovim NOT neovide)
-- end
-- local p = require("config.colorpalette")
--
--
-- return {
--     {
--         "folke/tokyonight.nvim",
--         lazy = false,
--         priority = 1000,
--         config = function()
--             require("tokyonight").setup({
--                 on_highlights = function(hl, _)
--                     hl.NormalFloat = { bg = p.bg_float }
--                     hl.FloatBorder = { fg = p.cursor, bg = p.bg_float }
--                     hl.FloatTitle  = { fg = p.cursor, bg = p.bg_float }
--                 end,
--             })
--             vim.cmd.colorscheme "tokyonight"
--
--
--             vim.api.nvim_create_autocmd("VimEnter", {
--                 once = true,
--                 callback = function()
--                     vim.api.nvim_set_hl(0, "NormalFloat",          { bg = p.bg_float })
--                     vim.api.nvim_set_hl(0, "FloatBorder",          { fg = p.cursor, bg = p.bg_float })
--                     vim.api.nvim_set_hl(0, "FloatTitle",           { fg = p.cursor, bg = p.bg_float })
--                     vim.api.nvim_set_hl(0, "NeoTreeNormal",        { bg = p.bg_float })
--                     vim.api.nvim_set_hl(0, "NeoTreeNormalNC",      { bg = p.bg_float })
--                     vim.api.nvim_set_hl(0, "NeoTreeWinSeparator",  { fg = p.cursor, bg = p.bg_float })
--                     vim.api.nvim_set_hl(0, "NeoTreeRootName",      { fg = p.cursor, bold = true })
--                     vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = p.lavender })
--                     vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = p.purple })
--                     vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened",{ fg = p.cursor, bold = true })
--                     -- Telescope
--                     vim.api.nvim_set_hl(0, "TelescopeBorder",         { fg = p.cursor })
--                     vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { fg = p.cursor })
--                     vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { fg = p.cursor })
--                     vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { fg = p.cursor })
--                     vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = p.cursor })
--                     vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = p.cursor, bold = true })
--                 end,
--             })
--         end,
--     },
-- }
