return {
    "Beargruug/skipper.nvim",
    event = "BufReadPost",
    config = function()
        -- Obre una finestra amb totes les funcions del fitxer actual
        -- i permet saltar-hi directament
        vim.keymap.set("n", "<leader>cf", "<cmd>ShowFunctionsWindow<CR>",
            { desc = "[C]ode [F]unctions (skipper)" })
    end,
}
