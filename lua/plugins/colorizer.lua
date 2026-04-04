return {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        filetypes = { "*" }, -- tots els fitxers
        user_default_options = {
            RGB      = true,   -- #RGB
            RRGGBB   = true,   -- #RRGGBB
            RRGGBBAA = true,   -- #RRGGBBAA
            names    = false,  -- no coloreja "red", "blue"... (massa soroll)
            css      = true,   -- formats css (hsl, rgb()...)
            mode     = "background", -- mostra el color com a fons del quadradet es pot posar "foreground"
        },
    },
}
