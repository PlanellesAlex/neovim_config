return {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- Obre lazygit en una finestra flotant
        vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>",
            { desc = "[G]it La[g]ygit" })

        -- Obre lazygit al directori del fitxer actual
        vim.keymap.set("n", "<leader>gf", "<cmd>LazyGitCurrentFile<CR>",
            { desc = "[G]it current [F]ile" })
    end,
}
