-- Tinc una cosa instal·lada que es diu `glow` on puc fer a la terminal:
-- `glow` i em permet escollir quin fitxer (del directori actual) vull renderitzar 
-- com a markdown. (També puc fer `glow <fitxer>`)
--
-- Un altre es markdown-preview.nvim pero requereix Node.js
--
-- Un altre es peek.nvim però requereix Deno
--
local p = require("config.colorpalette")

return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown", "md" },
    opts = {
        heading = {
            enabled = true,
            icons   = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        },
        code = {
            enabled = true,
            style   = "full",
            border  = "thin",
        },
        bullet   = { enabled = true, icons = { "●", "○", "◆", "◇" } },
        checkbox = {
            enabled   = true,
            unchecked = { icon = "󰄱 " },
            checked   = { icon = "󰱒 " },
        },
        dash  = { enabled = true, icon = "─" },
        quote = { enabled = true, icon = "▋" },
        link  = { enabled = true, hyperlink = "󰌹 ", image = "󰥶 " },
        pipe_table = {
            enabled = true,
            style   = "full",   -- mostra els bordes de la taula sencers
        },
        on = {
            attach = function()
                vim.keymap.set("n", "<leader>tr", function()
                    local md = require("render-markdown")
                    if require("render-markdown.state").enabled then
                        md.disable()
                    else
                        md.enable()
                    end
                end, { buffer = true, desc = "[T]oggle [R]ender markdown" })
            end,
        },
    },
    config = function(_, opts)
        -- Taules
        vim.api.nvim_set_hl(0, "RenderMarkdownTableHead",     { fg = p.purple, bold = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownTableRow",      { fg = p.lavender })
        vim.api.nvim_set_hl(0, "RenderMarkdownTableFill",     { fg = p.purple_bright })

        -- Bullets, checkboxes, quotes, dash, links
        vim.api.nvim_set_hl(0, "RenderMarkdownBullet",    { fg = p.purple })
        vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = p.fg_dim })
        vim.api.nvim_set_hl(0, "RenderMarkdownChecked",   { fg = p.purple_bright })
        vim.api.nvim_set_hl(0, "RenderMarkdownQuote",     { fg = p.lavender, italic = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownDash",      { fg = p.purple })
        vim.api.nvim_set_hl(0, "RenderMarkdownLink",      { fg = p.cyan, underline = true })

        require("render-markdown").setup(opts)
    end,
}
