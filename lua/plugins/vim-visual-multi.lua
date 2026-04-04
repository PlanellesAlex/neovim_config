local p = require("config.colorpalette")

return {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
    init = function()
        -- Colors dels cursors múltiples
        vim.g.VM_highlight_matches    = "underline"
        vim.g.VM_theme                = "iceblue"  -- tema base (sobreescrivim els colors)

        -- Keymaps principals (els defaults de vim-visual-multi)
        -- <C-n>     → selecciona la paraula sota el cursor i busca la següent
        -- <C-Down>  → afegeix cursor a sota
        -- <C-Up>    → afegeix cursor a sobre
        -- \\A        → selecciona totes les coincidències
        -- \\/ + text → busca i selecciona totes les coincidències

        vim.g.VM_maps = {
            ["Find Under"]         = "<C-k>",   -- selecciona paraula i busca següent
            ["Find Subword Under"] = "<C-k>",
            ["Add Cursor Down"]    = "<C-Down>",
            ["Add Cursor Up"]      = "<C-Up>",
            ["Select All"]         = "<leader>va",
            ["Start Regex Search"] = "<leader>v/",
            ["Add Cursor At Pos"]  = "<C-x>",   -- afegeix cursor a la posició actual
        }
    end,
    config = function()
        -- Colors liles per als cursors múltiples
        vim.api.nvim_set_hl(0, "VM_Extend",  { bg = p.bg_float_sel })
        vim.api.nvim_set_hl(0, "VM_Cursor",  { bg = p.cursor, fg = p.bg })
        vim.api.nvim_set_hl(0, "VM_Insert",  { bg = p.purple, fg = p.bg })
        vim.api.nvim_set_hl(0, "VM_Mono",    { bg = p.purple_bright, fg = p.bg })
    end,
}
