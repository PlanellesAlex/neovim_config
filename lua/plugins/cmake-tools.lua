return {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "cmake", "c", "cpp" },
    config = function()
        require("cmake-tools").setup({
            cmake_command            = "cmake",
            cmake_build_directory    = "build",  -- carpeta de build
            cmake_generate_options   = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- per clangd
            cmake_build_options      = {},
            cmake_console_size       = 10,
            cmake_console_position   = "bottom",
            cmake_show_console       = "always",
            cmake_dap_configuration  = {          -- integració amb DAP (debugging)
                name    = "cpp",
                type    = "cppdbg",
                request = "launch",
            },
            cmake_variants_message = {
                short = { show = false },
                long  = { show = false },
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>mg", "<cmd>CMakeGenerate<CR>",
            { desc = "[M]ake [G]enerate (cmake configure)" })
        vim.keymap.set("n", "<leader>mb", "<cmd>CMakeBuild<CR>",
            { desc = "[M]ake [B]uild" })
        vim.keymap.set("n", "<leader>mr", "<cmd>CMakeRun<CR>",
            { desc = "[M]ake [R]un" })
        vim.keymap.set("n", "<leader>md", "<cmd>CMakeDebug<CR>",
            { desc = "[M]ake [D]ebug" })
        vim.keymap.set("n", "<leader>mt", "<cmd>CMakeSelectBuildTarget<CR>",
            { desc = "[M]ake select [T]arget" })
        vim.keymap.set("n", "<leader>mc", "<cmd>CMakeClean<CR>",
            { desc = "[M]ake [C]lean" })
        vim.keymap.set("n", "<leader>ms", "<cmd>CMakeStop<CR>",
            { desc = "[M]ake [S]top" })
    end,
}
