local p = require("config.colorpalette")

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,  -- tanca neovim si neo-tree és l'última finestra
            popup_border_style   = "rounded",
            enable_git_status    = true,
            enable_diagnostics   = true,

            default_component_configs = {
                indent = {
                    indent_size        = 2,
                    with_markers       = true,
                    indent_marker      = "│",
                    last_indent_marker = "└",
                },
                git_status = {
                    symbols = {
                        added     = "",
                        modified  = "",
                        deleted   = "✗",
                        renamed   = "󰁕",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    },
                },
            },

            window = {
                position = "float", -- left, float, top, bottom, current, right
                width     = 35,
                mappings  = {
                    ["<space>"] = "none",
		    ["P"]	= {"toggle_preview", config = { use_float = true }},
                    ["l"]       = "open",
                    ["h"]       = "close_node",
                    ["v"]       = "open_vsplit",
                    ["s"]       = "open_split",
                    ["a"]       = "add",
                    ["d"]       = "delete",
                    ["r"]       = "rename",
                    ["c"]       = "copy",
                    ["m"]       = "move",
                    ["q"]       = "close_window",
                    ["?"]       = "show_help",
                },
            },

            filesystem = {
                filtered_items = {
                    visible        = false,
                    hide_dotfiles  = true,  -- mostra fitxers ocults (.env, .gitignore...)
                    hide_gitignored = true,
                },
                follow_current_file = {
                    enabled = true,          -- ressalta el fitxer obert a l'arbre
                },
                use_libuv_file_watcher = true, -- detecta canvis externs automàticament
            },
        })

        -- Colors liles
        vim.api.nvim_set_hl(0, "NeoTreeNormal",       { bg = p.bg_alt })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC",     { bg = p.bg_alt })
        vim.api.nvim_set_hl(0, "NeoTreeBorder",       { fg = p.cursor, bg = p.bg_alt })
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = p.cursor, bg = p.bg })
        vim.api.nvim_set_hl(0, "NeoTreeRootName",     { fg = p.purple, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryName",{ fg = p.lavender })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon",{ fg = p.purple })
        vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened",{ fg = p.cursor, bold = true })

        -- Keymaps
        vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>",
            { desc = "Toggle [E]xplorer" })
        vim.keymap.set("n", "<leader>ef", "<cmd>Neotree reveal<CR>",
            { desc = "[E]xplorer reveal current [F]ile" })
        vim.keymap.set("n", "<leader>eg", "<cmd>Neotree git_status<CR>",
            { desc = "[E]xplorer [G]it status" })
    end,
}
