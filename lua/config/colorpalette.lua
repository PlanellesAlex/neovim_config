-- ═══════════════════════════════════════════════════════════════════════════
-- COLOR PALETTE
-- Per fer servir-lo en qualsevol fitxer:
--   local p = require("config.colorpalette")
--   vim.api.nvim_set_hl(0, "Normal", { fg = p.fg, bg = p.bg })
-- ═══════════════════════════════════════════════════════════════════════════

local p = {}

-- ─── Fons ─────────────────────────────────────────────────────────────────
p.bg              = "#1f1f24"   -- fons principal
p.bg_alt          = "#292930"   -- fons alternatiu (tabs actives, popups)
p.bg_dark         = "#26262b"   -- fons cursor line
p.bg_darker       = "#2a2a30"   -- fons color column
p.bg_popup        = "#262632"   -- fons pmenu / autocomplete
p.bg_popup_sel    = "#2d3136"   -- fons pmenu seleccionat
p.bg_popup_scroll = "#2d2d30"   -- fons scrollbar pmenu
p.bg_float        = "#2a2040"   -- fons floating windows (hover, cmp) → lila fosc
p.bg_float_sel    = "#3a2a5a"   -- fons selecció floating windows
p.bg_diff_add     = "#27403B"   -- fons diff add
p.bg_diff_change  = "#28384B"   -- fons diff change
p.bg_diff_delete  = "#3a1a1a"   -- fons diff delete
p.bg_diff_text    = "#395F8F"   -- fons diff text
p.bg_lsp_ref      = "#3d3d3d"   -- fons lsp reference text/read
p.bg_lsp_write    = "#003a5c"   -- fons lsp reference write

-- ─── Text ─────────────────────────────────────────────────────────────────
p.fg              = "#c4c8d1"   -- text principal
p.fg_dim          = "#606060"   -- text apagat (comentaris, inactiu)
p.fg_subtle       = "#555560"   -- números de línia
p.fg_inactive     = "#444450"   -- números de línia inactius
p.fg_active_ln    = "#A0A0A0"   -- número de línia actiu
p.fg_statusline   = "#a0a0a8"   -- text statusline sections b/c
p.fg_tabline      = "#e6e6e6"   -- text tabline inactiva
p.white           = "#ffffff"
p.none            = "NONE"

-- ─── Colors principals (syntax) ───────────────────────────────────────────
p.purple_bright   = "#9635ea"   -- normal mode, borders floating, keywords forts
p.purple          = "#b861ea"   -- keywords, storage, control flow, insert mode
p.purple_light    = "#d4a0f5"   -- (reservat, ex-insert mode cursor)
p.lavender        = "#acaaff"   -- operadors, support types, snippets
p.pink            = "#de597e"   -- tags, punctuation especial, replace mode
p.cyan            = "#57d6ee"   -- funcions, mètodes
p.green           = "#a8f387"   -- strings, characters
p.green2          = "#63b7b0"   -- strings alternatius
p.yellow          = "#ffe380"   -- classes, tipus, namespaces, self
p.orange          = "#cd8568"   -- constants, números, paràmetres

-- ─── Colors de mode (statusline + cursor) ─────────────────────────────────
p.mode_normal     = "#9635ea"   -- NORMAL    → lila fosc
p.mode_insert     = "#b861ea"   -- INSERT    → lila rosat
p.mode_visual     = "#e0af68"   -- VISUAL / V-LINE / V-BLOCK → groc
p.mode_terminal   = "#00e676"   -- TERMINAL  → verd cridaner
p.mode_replace    = "#de597e"   -- REPLACE   → rosa
p.mode_command    = "#a200ff"   -- COMMAND   → lila pur (igual que cursor i borders)

-- ─── Cursor ───────────────────────────────────────────────────────────────
p.cursor          = "#a200ff"   -- cursor principal i borders floating cmd

-- ─── Diagnòstics LSP ──────────────────────────────────────────────────────
p.diag_error      = "#f48771"
p.diag_warn       = "#cca700"
p.diag_info       = "#75beff"
p.diag_hint       = "#57d6ee"   -- = p.cyan
p.error_hard      = "#f44747"   -- errors molt greus

-- ─── Git ──────────────────────────────────────────────────────────────────
p.git_add         = "#587c0c"
p.git_change      = "#0c7d9d"
p.git_delete      = "#94151b"

-- ─── Separadors i misc UI ─────────────────────────────────────────────────
p.border          = "#444444"   -- separadors de finestres
p.border_subtle   = "#454545"   -- border telescope
p.scrollbar       = "#5f5f5f"   -- scrollbar thumb
p.selection       = "#323232"   -- visual selection, quickfix
p.whitespace      = "#2e2e33"   -- whitespace chars (trail, nbsp)
p.end_of_buf      = "#333338"   -- ~ al final del buffer
p.non_text        = "#333338"   -- NonText

-- ─── Todo Comments ────────────────────────────────────────────────────────
p.todo_todo       = "#2563EB"
p.todo_fix        = "#DC2626"
p.todo_hack       = "#FBBF24"
p.todo_warn       = "#FBBF24"
p.todo_note       = "#10B981"
p.todo_perf       = "#acaaff"   -- = p.lavender

-- ─── Statusline sections (background) ────────────────────────────────────
p.statusline_bg_b = "#28282e"   -- fons section b/c statusline

-- colors floating terminal
p.terminal_fg = "#e6aeff"  -- canvia pel hex exacte

return p
