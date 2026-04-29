local p = require("config.colorpalette")

local function apply()
    -- ── Float base ────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "NormalFloat",   { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "FloatBorder",   { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "FloatTitle",    { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "FloatFooter",   { fg = p.cursor, bg = p.bg_float })

    -- ── LSP ───────────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "LspInfoBorder",               { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "LspHoverNormal",              { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "LspHoverBorder",              { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = p.cursor, bold = true, underline = true })
    vim.api.nvim_set_hl(0, "LspInlayHint",                { fg = p.fg_dim, italic = true })

    -- ── Noice ─────────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "NoicePopup",              { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NoicePopupBorder",        { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NoiceLspDocBorder",       { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NoiceLspDoc",             { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NoiceSignatureBorder",    { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NoiceSignature",          { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",       { bg = p.none })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = p.cursor, bg = p.none })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIcon",        { fg = p.cursor })
    -- notifications (info/debug/trace only — warn/error keep semantic colors)
    vim.api.nvim_set_hl(0, "NoiceNotification",         { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NoiceNotificationBorder",   { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyINFOBorder",  { fg = p.cursor,  bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyINFOTitle",   { fg = p.purple,  bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyINFOIcon",    { fg = p.cursor,  bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyINFOBody",    { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = p.cursor,  bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyDEBUGTitle",  { fg = p.purple,  bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyDEBUGIcon",   { fg = p.cursor,  bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBody",   { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = p.lavender, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyTRACETitle",  { fg = p.lavender, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyTRACEIcon",   { fg = p.lavender, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "NotifyTRACEBody",   { bg = p.bg_float })

    -- ── nvim-cmp ──────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "CmpNormal",             { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "CmpBorder",             { fg = p.cursor, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "CmpDocBorder",          { fg = p.purple_bright, bg = p.bg_float })
    vim.api.nvim_set_hl(0, "CmpSel",                { fg = p.white, bg = p.bg_float_sel, bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",      { fg = p.purple, bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = p.purple_bright })
    vim.api.nvim_set_hl(0, "CmpItemMenu",           { fg = p.fg_dim, italic = true })
    vim.api.nvim_set_hl(0, "CmpItemKindFunction",   { fg = p.cyan })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod",     { fg = p.cyan })
    vim.api.nvim_set_hl(0, "CmpItemKindClass",      { fg = p.yellow })
    vim.api.nvim_set_hl(0, "CmpItemKindModule",     { fg = p.yellow })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable",   { fg = p.purple })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword",    { fg = p.purple_bright })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet",    { fg = p.lavender })
    vim.api.nvim_set_hl(0, "CmpItemKindText",       { fg = p.fg })

    -- ── Telescope ─────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "TelescopeBorder",         { fg = p.cursor })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { fg = p.cursor })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { fg = p.cursor })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { fg = p.cursor })
    vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = p.cursor })
    vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = p.cursor, bold = true })

    -- ── Neo-tree ──────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "NeoTreeNormal",          { bg = p.bg_alt })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC",        { bg = p.bg_alt })
    vim.api.nvim_set_hl(0, "NeoTreeBorder",          { fg = p.cursor, bg = p.bg_alt })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator",    { fg = p.cursor, bg = p.bg })
    vim.api.nvim_set_hl(0, "NeoTreeRootName",        { fg = p.purple, bold = true })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName",   { fg = p.lavender })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon",   { fg = p.purple })
    vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened",  { fg = p.cursor, bold = true })

    -- ── Toggleterm ────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "ToggleTermNormal", { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = p.cursor, bg = p.bg_float })
    for i = 1, 10 do
        vim.api.nvim_set_hl(0, "ToggleTerm" .. i .. "NormalFloat", { bg = p.bg_float })
        vim.api.nvim_set_hl(0, "ToggleTerm" .. i .. "FloatBorder", { fg = p.cursor, bg = p.bg_float })
    end

    -- ── Which-key ─────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "WhichKeyFloat",  { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = p.cursor, bg = p.bg_float })

    -- ── Aerial ────────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "AerialNormal",   { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "AerialLine",     { bg = p.bg_float_sel, bold = true })
    vim.api.nvim_set_hl(0, "AerialGuide",    { fg = p.fg_dim })
    vim.api.nvim_set_hl(0, "AerialClass",    { fg = p.yellow })
    vim.api.nvim_set_hl(0, "AerialFunction", { fg = p.cyan })
    vim.api.nvim_set_hl(0, "AerialMethod",   { fg = p.cyan })
    vim.api.nvim_set_hl(0, "AerialModule",   { fg = p.yellow })
    vim.api.nvim_set_hl(0, "AerialStruct",   { fg = p.yellow })

    -- ── Dropbar ───────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "DropBarCurrentContext",     { fg = p.purple, bold = true })
    vim.api.nvim_set_hl(0, "DropBarMenuCurrentContext", { fg = p.purple })
    vim.api.nvim_set_hl(0, "DropBarIconKindFunction",   { fg = p.cyan })
    vim.api.nvim_set_hl(0, "DropBarIconKindMethod",     { fg = p.cyan })
    vim.api.nvim_set_hl(0, "DropBarIconKindClass",      { fg = p.yellow })
    vim.api.nvim_set_hl(0, "DropBarIconKindModule",     { fg = p.yellow })
    vim.api.nvim_set_hl(0, "DropBarMenuNormalFloat",    { bg = p.bg_float })
    vim.api.nvim_set_hl(0, "DropBarMenuFloatBorder",    { fg = p.cursor, bg = p.bg_float })

    -- ── Indent blankline ──────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "IblIndent",          { fg = p.purple_light })
    vim.api.nvim_set_hl(0, "IblScope",           { fg = p.purple })
    vim.api.nvim_set_hl(0, "IblScopeUnderline1", { sp = p.purple, underdouble = true })

    -- ── render-markdown ───────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = p.purple, bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownTableRow",  { fg = p.lavender })
    vim.api.nvim_set_hl(0, "RenderMarkdownTableFill", { fg = p.purple_bright })
    vim.api.nvim_set_hl(0, "RenderMarkdownBullet",    { fg = p.purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = p.fg_dim })
    vim.api.nvim_set_hl(0, "RenderMarkdownChecked",   { fg = p.purple_bright })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote",     { fg = p.lavender, italic = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownDash",      { fg = p.purple })
    vim.api.nvim_set_hl(0, "RenderMarkdownLink",      { fg = p.cyan, underline = true })

    -- ── Biscuits ──────────────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "BiscuitColor", { fg = p.fg_dim, italic = true })

    -- ── vim-visual-multi ──────────────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "VM_Extend", { bg = p.bg_float_sel })
    vim.api.nvim_set_hl(0, "VM_Cursor", { bg = p.cursor, fg = p.bg })
    vim.api.nvim_set_hl(0, "VM_Insert", { bg = p.purple, fg = p.bg })
    vim.api.nvim_set_hl(0, "VM_Mono",   { bg = p.purple_bright, fg = p.bg })
end

-- Fire after all VeryLazy plugins have loaded (covers first startup)
vim.api.nvim_create_autocmd("User", {
    pattern  = "VeryLazy",
    once     = true,
    callback = apply,
})

-- Re-apply whenever the colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = apply,
})
