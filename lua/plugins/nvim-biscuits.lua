local p = require("config.colorpalette")

return {
    "code-biscuits/nvim-biscuits",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPost",
    config = function()
        require("nvim-biscuits").setup({
            show_on_start    = false,   -- no mostris els biscuits en obrir el fitxer
            cursor_line_only = false,  -- false = mostra en totes les línies
					-- true = mostra només quan ets a sobre
            prefix_string    = " 󰆉 ", -- icona davant del text
            max_length       = 40,     -- màxim de caràcters del context
            trim_by_words    = true,   -- talla per paraules, no per caràcters
        })

        vim.api.nvim_set_hl(0, "BiscuitColor", { fg = p.fg_dim, italic = true })

        -- Toggle manual
        vim.keymap.set("n", "<leader>tb", function()
            require("nvim-biscuits").toggle_biscuits()
        end, { desc = "[T]oggle [B]iscuits" })
    end,
}
