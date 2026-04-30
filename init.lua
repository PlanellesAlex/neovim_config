require("config.dashboard")
require("config.options")
require("config.keymaps")
require("config.autocommands")
require("config.neovide")
require("config.highlights")
require("config.lazy") -- Plugin Manager
require("noice").notify("Hello from Alex P config", "info", {
    title = "Welcome",
    timeout = 1000,
    render = "minimal",
})

-- Aixo d'aqui ho fa folke/todo-comments.nvim
-- TODO: procrastinar
-- WARNING: alerta
-- PERF: perfectament optimitzat
-- NOTE: nota
-- FIX: your attitude
-- HACK: hackathon
