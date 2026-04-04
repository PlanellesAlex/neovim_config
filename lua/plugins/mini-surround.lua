return {
    "echasnovski/mini.surround",
    version = "*",
    event = "BufReadPost",
    opts = {
        mappings = {
            add            = "gza",  -- afegir surround: gza + motion + caràcter
            delete         = "gzd",  -- esborrar surround: gzd
            find           = "gzf",  -- buscar surround endavant
            find_left      = "gzF",  -- buscar surround enrere
            highlight      = "gzh",  -- ressaltar surround
            replace        = "gzr",  -- reemplaçar surround: gzr + vell + nou
            update_n_lines = "gzn",  -- actualitzar n línies de context
        },
    },
}
