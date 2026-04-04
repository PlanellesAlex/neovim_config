return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPost",
    opts = {
        use_default_keymaps = false,
        check_syntax_error  = true,
        max_join_length     = 120,   -- màxim de caràcters per fer join en una línia
    },
    config = function(_, opts)
        require("treesj").setup(opts)

        -- Split: expandeix una línia en múltiples
        vim.keymap.set("n", "<leader>js", require("treesj").split,
            { desc = "[J]oin [S]plit block" })

        -- Join: col·lapsa múltiples línies en una
        vim.keymap.set("n", "<leader>jj", require("treesj").join,
            { desc = "[J]oin block" })

        -- Toggle: split o join automàticament segons el context
        vim.keymap.set("n", "<leader>jt", require("treesj").toggle,
            { desc = "[J]oin [T]oggle" })
    end,
}
