-- Gravity colorscheme for Neovim
-- Ported from the VSCode Gravity theme

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "gravity"
vim.o.background = "dark"

local set = vim.api.nvim_set_hl

-- Paleta de colors
local c = {
    bg         = "#1f1f24",
    bg_alt     = "#292930",
    fg         = "#c4c8d1",
    fg_dim     = "#606060",
    line_hl    = "#26262b",
    selection  = "#323232",
    cursor     = "#a200ff",
    ln_inactive= "#444450",
    ln_active  = "#A0A0A0",

    -- Colors de mode
    m_normal   = "#9635ea",   -- lila fosc pastel  → NORMAL
    m_insert   = "#b861ea",   -- lila rosat pastel → INSERT
    m_visual   = "#e0af68",   -- groc              → VISUAL
    m_terminal = "#00e676",   -- verd cridaner     → TERMINAL

    pink       = "#c98cf2",   -- variables, tags, keywords especials
    purple     = "#b861ea",   -- keywords, storage, control flow
    cyan       = "#57d6ee",   -- funcions, metodes
    green      = "#a8f387",   -- strings
    green2     = "#63b7b0",
    yellow     = "#ffe380",   -- classes, tipus, namespaces, self
    orange     = "#cd8568",   -- constants, numeros, parametres
    lavender   = "#acaaff",   -- operadors, support types
    white      = "#ffffff",
    none       = "NONE",
}

-- ─── Editor UI ────────────────────────────────────────────────────────────────
set(0, "Normal",          { fg = c.fg,          bg = c.bg })
set(0, "NormalFloat",     { fg = c.fg,          bg = c.bg_alt })
set(0, "NormalNC",        { fg = c.fg,          bg = c.bg })
set(0, "FloatBorder",     { fg = c.fg_dim,      bg = c.bg_alt })
set(0, "ColorColumn",     { bg = "#2a2a30" })
set(0, "CursorLine",      { bg = "#26262b" })
set(0, "CursorColumn",    { bg = "#26262b" })
set(0, "CursorLineNr",    { fg = c.ln_active,   bold = true })
set(0, "LineNr",          { fg = "#555560" })
set(0, "SignColumn",      { fg = c.fg_dim,      bg = c.bg })
set(0, "VertSplit",       { fg = "#444444",     bg = c.bg })
set(0, "WinSeparator",    { fg = "#444444",     bg = c.bg })
set(0, "Folded",          { fg = c.fg_dim,      bg = c.bg_alt })
set(0, "FoldColumn",      { fg = c.fg_dim,      bg = c.bg })
set(0, "EndOfBuffer",     { fg = "#333338" })

-- Selecció i cerca
set(0, "Visual",          { bg = c.selection })
set(0, "VisualNOS",       { bg = c.selection })
set(0, "Search",          { fg = c.bg,          bg = c.cyan })
set(0, "IncSearch",       { fg = c.bg,          bg = c.cursor })
set(0, "CurSearch",       { fg = c.bg,          bg = c.cursor })
set(0, "MatchParen",      { fg = c.cursor,      bold = true, underline = true })
set(0, "Substitute",      { fg = c.bg,          bg = c.pink })

-- Cursor per mode
set(0, "Cursor",          { fg = c.bg,          bg = c.m_normal })
set(0, "lCursor",         { fg = c.bg,          bg = c.m_normal })
set(0, "CursorIM",        { fg = c.bg,          bg = c.m_normal })
set(0, "CursorInsert",    { fg = c.bg,          bg = c.m_insert })
set(0, "CursorVisual",    { fg = c.bg,          bg = c.m_visual })
set(0, "CursorTerminal",  { fg = c.bg,          bg = c.m_terminal })


-- StatusLine
set(0, "StatusLine",      { fg = c.white,       bg = c.bg })
set(0, "StatusLineNC",    { fg = c.fg_dim,      bg = c.bg })

-- Tabline
set(0, "TabLine",         { fg = "#e6e6e6",     bg = c.bg })
set(0, "TabLineSel",      { fg = c.white,       bg = c.bg_alt })
set(0, "TabLineFill",     { bg = c.bg })

-- Popup / Autocomplete
set(0, "Pmenu",           { fg = c.fg,          bg = "#262632" })
set(0, "PmenuSel",        { fg = c.fg,          bg = "#2d3136" })
set(0, "PmenuSbar",       { bg = "#2d2d30" })
set(0, "PmenuThumb",      { bg = "#5f5f5f" })


-- Missatges
set(0, "ErrorMsg",        { fg = "#f48771" })
set(0, "WarningMsg",      { fg = "#cca700" })
set(0, "MoreMsg",         { fg = c.cyan })
set(0, "ModeMsg",         { fg = c.fg })
set(0, "Question",        { fg = c.cyan })

-- Misc UI
set(0, "NonText",         { fg = "#333338" })
set(0, "Whitespace",      { fg = "#2e2e33" })
set(0, "SpecialKey",      { fg = "#444444" })
set(0, "Title",           { fg = c.cyan,        bold = true })
set(0, "Directory",       { fg = c.cyan })
set(0, "WildMenu",        { fg = c.bg,          bg = c.cursor })
set(0, "QuickFixLine",    { bg = c.selection })

-- Diff
set(0, "DiffAdd",         { bg = "#27403B" })
set(0, "DiffChange",      { bg = "#28384B" })
set(0, "DiffDelete",      { bg = "#3a1a1a" })
set(0, "DiffText",        { bg = "#395F8F" })
set(0, "Added",           { fg = c.green })
set(0, "Changed",         { fg = c.yellow })
set(0, "Removed",         { fg = c.pink })

-- ─── Syntax ───────────────────────────────────────────────────────────────────
set(0, "Comment",         { fg = c.fg_dim,      italic = true })
set(0, "SpecialComment",  { fg = c.fg_dim,      italic = true })

set(0, "Constant",        { fg = c.orange })
set(0, "String",          { fg = c.green2 })
set(0, "Character",       { fg = c.green })
set(0, "Number",          { fg = c.orange })
set(0, "Boolean",         { fg = c.purple })
set(0, "Float",           { fg = c.orange })

set(0, "Identifier",      { fg = c.pink })
set(0, "Function",        { fg = c.cyan })

set(0, "Statement",       { fg = c.purple })
set(0, "Conditional",     { fg = c.purple })
set(0, "Repeat",          { fg = c.purple })
set(0, "Label",           { fg = c.purple })
set(0, "Operator",        { fg = c.lavender })
set(0, "Keyword",         { fg = c.purple })
set(0, "Exception",       { fg = c.purple })

set(0, "PreProc",         { fg = c.purple })
set(0, "Include",         { fg = c.purple })
set(0, "Define",          { fg = c.purple })
set(0, "Macro",           { fg = c.purple })
set(0, "PreCondit",       { fg = c.purple })

set(0, "Type",            { fg = c.yellow })
set(0, "StorageClass",    { fg = c.purple })
set(0, "Structure",       { fg = c.yellow })
set(0, "Typedef",         { fg = c.yellow })

set(0, "Special",         { fg = c.cyan })
set(0, "SpecialChar",     { fg = c.orange })
set(0, "Tag",             { fg = c.pink })
set(0, "Delimiter",       { fg = c.fg })
set(0, "Debug",           { fg = c.purple })

set(0, "Underlined",      { fg = c.cyan,        underline = true })
set(0, "Ignore",          { fg = c.fg_dim })
set(0, "Error",           { fg = "#f44747" })
set(0, "Todo",            { fg = c.cyan,        bold = true })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
-- Variables
set(0, "@variable",                 { fg = c.pink })
set(0, "@variable.builtin",         { fg = c.yellow })   -- self, this
set(0, "@variable.parameter",       { fg = c.orange })
set(0, "@variable.member",          { fg = c.pink })

-- Funcions
set(0, "@function",                 { fg = c.purple })
set(0, "@function.builtin",         { fg = c.cyan })
set(0, "@function.call",            { fg = c.purple })
set(0, "@function.method",          { fg = c.cyan })
set(0, "@function.method.call",     { fg = c.cyan })
set(0, "@constructor",              { fg = c.yellow })

-- Keywords
set(0, "@keyword",                  { fg = c.purple })
set(0, "@keyword.function",         { fg = c.purple })
set(0, "@keyword.return",           { fg = c.purple })
set(0, "@keyword.operator",         { fg = c.lavender })
set(0, "@keyword.import",           { fg = c.cyan })
set(0, "@keyword.conditional",      { fg = c.purple })
set(0, "@keyword.repeat",           { fg = c.purple })
set(0, "@keyword.exception",        { fg = c.purple })

-- Tipus
set(0, "@type",                     { fg = c.yellow })
set(0, "@type.builtin",             { fg = c.lavender })
set(0, "@type.definition",          { fg = c.yellow })

-- Constants
set(0, "@constant",                 { fg = c.orange })
set(0, "@constant.builtin",         { fg = c.orange })
set(0, "@constant.macro",           { fg = c.orange })
set(0, "@number",                   { fg = c.orange })
set(0, "@number.float",             { fg = c.orange })
set(0, "@boolean",                  { fg = c.purple })

-- Strings
set(0, "@string",                   { fg = c.green2 })
set(0, "@string.escape",            { fg = c.lavender })
set(0, "@string.special",           { fg = c.lavender })
set(0, "@string.regexp",            { fg = c.lavender })
set(0, "@character",                { fg = c.green })

-- Operadors i puntuació
set(0, "@operator",                 { fg = c.lavender })
set(0, "@punctuation.bracket",      { fg = c.fg })
set(0, "@punctuation.delimiter",    { fg = c.fg })
set(0, "@punctuation.special",      { fg = c.pink })

-- Comentaris
set(0, "@comment",                  { fg = c.fg_dim, italic = true })
set(0, "@comment.documentation",    { fg = c.fg_dim, italic = true })

-- Namespace / Modules
set(0, "@module",                   { fg = c.yellow })
set(0, "@namespace",                { fg = c.yellow })
set(0, "@label",                    { fg = c.purple })

-- HTML/JSX Tags
set(0, "@tag",                      { fg = c.pink })
set(0, "@tag.attribute",            { fg = c.orange })
set(0, "@tag.delimiter",            { fg = c.fg })

-- Propietats
set(0, "@property",                 { fg = c.pink })
set(0, "@attribute",                { fg = c.orange })

-- ─── LSP ──────────────────────────────────────────────────────────────────────
set(0, "DiagnosticError",           { fg = "#f48771" })
set(0, "DiagnosticWarn",            { fg = "#cca700" })
set(0, "DiagnosticInfo",            { fg = "#75beff" })
set(0, "DiagnosticHint",            { fg = c.cyan })
set(0, "DiagnosticUnderlineError",  { undercurl = true, sp = "#f48771" })
set(0, "DiagnosticUnderlineWarn",   { undercurl = true, sp = "#cca700" })
set(0, "DiagnosticUnderlineInfo",   { undercurl = true, sp = "#75beff" })
set(0, "DiagnosticUnderlineHint",   { undercurl = true, sp = c.cyan })

set(0, "LspReferenceText",          { bg = "#3d3d3d" })
set(0, "LspReferenceRead",          { bg = "#3d3d3d" })
set(0, "LspReferenceWrite",         { bg = "#003a5c" })

-- LSP semantic tokens
set(0, "@lsp.type.class",           { fg = c.yellow })
set(0, "@lsp.type.enum",            { fg = c.yellow })
set(0, "@lsp.type.enumMember",      { fg = c.lavender })
set(0, "@lsp.type.function",        { fg = c.cyan })
set(0, "@lsp.type.interface",       { fg = c.yellow })
set(0, "@lsp.type.keyword",         { fg = c.purple })
set(0, "@lsp.type.method",          { fg = c.cyan })
set(0, "@lsp.type.namespace",       { fg = c.yellow })
set(0, "@lsp.type.number",          { fg = c.orange })
set(0, "@lsp.type.operator",        { fg = c.lavender })
set(0, "@lsp.type.parameter",       { fg = c.orange })
set(0, "@lsp.type.property",        { fg = c.pink })
set(0, "@lsp.type.string",          { fg = c.green })
set(0, "@lsp.type.struct",          { fg = c.yellow })
set(0, "@lsp.type.type",            { fg = c.yellow })
set(0, "@lsp.type.typeParameter",   { fg = c.yellow })
set(0, "@lsp.type.variable",        { fg = c.pink })
set(0, "@lsp.mod.constant",         { fg = c.orange })
set(0, "@lsp.mod.defaultLibrary",   { fg = c.yellow })

-- ─── Gitsigns ─────────────────────────────────────────────────────────────────
set(0, "GitSignsAdd",               { fg = "#587c0c" })
set(0, "GitSignsChange",            { fg = "#0c7d9d" })
set(0, "GitSignsDelete",            { fg = "#94151b" })

-- ─── Telescope ────────────────────────────────────────────────────────────────
set(0, "TelescopeBorder",           { fg = "#454545",  bg = c.bg })
set(0, "TelescopeNormal",           { fg = c.fg,       bg = c.bg })
set(0, "TelescopeSelection",        { fg = c.fg,       bg = c.selection })
set(0, "TelescopeSelectionCaret",   { fg = c.cursor })
set(0, "TelescopeMatching",         { fg = c.cursor,   bold = true })
set(0, "TelescopePromptPrefix",     { fg = c.cursor })

-- ─── Which-key ────────────────────────────────────────────────────────────────
set(0, "WhichKey",                  { fg = c.cyan })
set(0, "WhichKeyGroup",             { fg = c.yellow })
set(0, "WhichKeyDesc",              { fg = c.fg })
set(0, "WhichKeySeparator",         { fg = c.fg_dim })
set(0, "WhichKeyFloat",             { bg = c.bg_alt })

-- ─── Noice ────────────────────────────────────────────────────────────────────
set(0, "NoiceCmdlinePopupBorder",   { fg = c.cursor })
set(0, "NoiceCmdlineIcon",          { fg = c.cursor })

-- ─── Todo Comments ────────────────────────────────────────────────────────────
set(0, "TodoFgTODO",                { fg = "#2563EB" })
set(0, "TodoFgFIX",                 { fg = "#DC2626" })
set(0, "TodoFgHACK",                { fg = "#FBBF24" })
set(0, "TodoFgWARN",                { fg = "#FBBF24" })
set(0, "TodoFgNOTE",                { fg = "#10B981" })
set(0, "TodoFgPERF",                { fg = c.lavender })
