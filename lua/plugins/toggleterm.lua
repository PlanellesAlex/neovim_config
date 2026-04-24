local p = require("config.colorpalette")

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return math.floor(vim.o.columns * 0.4)
                end
            end,
            open_mapping    = [[<C-t>]],
            hide_numbers    = true,
            shade_terminals = false,
            start_in_insert = true,
            insert_only     = false,
            persist_size    = true,
            persist_mode    = true,
            direction       = "float",
            close_on_exit   = true,
            shell           = vim.o.shell,
            auto_scroll     = true,
            -- Defineix els highlights directament aquí
            -- toggleterm els llegeix i crea ToggleTerm{N}NormalFloat etc.
            highlights = {
                NormalFloat = { guibg = p.bg_float },
                FloatBorder = { guifg = p.cursor, guibg = p.bg_float },
            },
            float_opts = {
                border   = "rounded",
                winblend = 0,
            },
        })

        -- Colors liles
        vim.api.nvim_set_hl(0, "ToggleTermNormal",  { bg = p.bg_float })
        vim.api.nvim_set_hl(0, "ToggleTermBorder",  { fg = p.cursor, bg = p.bg_float })

        -- Reaaplica highlights després del colorscheme
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "ToggleTermNormal", { bg = p.bg_float })
                vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = p.cursor, bg = p.bg_float })
            end,
        })

        -- Keymaps addicionals
        vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",
            { desc = "[T]oggle [F]loat terminal" })
        vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>",
            { desc = "[T]oggle [H]orizontal terminal" })
        vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>",
            { desc = "[T]oggle [V]ertical terminal" })

        -- Múltiples terminals numerades
        vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<CR>", { desc = "Terminal 1" })
        vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<CR>", { desc = "Terminal 2" })
        vim.keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<CR>", { desc = "Terminal 3" })

        -- Sortir del mode terminal amb Esc Esc (com ja tens configurat)
        function _G.set_terminal_keymaps()
            vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>",
                { buffer = 0, desc = "Sortir del mode terminal" })
            vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>ToggleTerm<CR>",
                { buffer = 0, desc = "Tanca el terminal" })
        end
        -- Força els colors liles a cada finestra de toggleterm
        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*toggleterm#*",
            callback = function()
                vim.defer_fn(function()
                    -- Busca la finestra flotant de toggleterm i aplica winhighlight
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local cfg = vim.api.nvim_win_get_config(win)
                        if cfg.relative ~= "" then
                            local buf = vim.api.nvim_win_get_buf(win)
                            local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })
                            if bt == "terminal" then
                                vim.api.nvim_win_set_option(win, "winhighlight",
                                    "Normal:NormalFloat,NormalNC:NormalFloat,FloatBorder:FloatBorder")
                            end
                        end
                    end
                end, 10)
                _G.set_terminal_keymaps()
            end,
        })
    end,
}
