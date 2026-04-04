return {
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            -- Visor: SumatraPDF
            vim.g.vimtex_view_method             = "general"
            vim.g.vimtex_view_general_viewer     = "C:\\Users\\User\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe"
            vim.g.vimtex_view_general_options    = "-reuse-instance @pdf"

            -- Compilador
            vim.g.vimtex_compiler_method  = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
                aux_dir    = "",
                out_dir    = "",
                callback   = 1,
                continuous = 0,
                executable = "latexmk",
                options    = {
                    "-biber",
                    "-shell-escape",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                },
            }

            vim.g.vimtex_quickfix_mode            = 2
            vim.g.vimtex_quickfix_open_on_warning = 0

            -- Detecció del fitxer principal i arrel del projecte
            vim.g.vimtex_root_markers = { "main.tex", ".git", ".latexmkrc" }
            vim.g.vimtex_syntax_enabled = 1
        end,
        config = function()
            -- Keymaps manuals (no els defaults de vimtex)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "tex", "latex" },
                callback = function()
                    local map = function(keys, cmd, desc)
                        vim.keymap.set("n", keys, cmd, { buffer = true, desc = desc })
                    end
                    map("<leader>ll", function()
                        local dir  = vim.fn.expand("%:p:h")
                        local file = vim.fn.expand("%:t")
                        local cmd  = "latexmk -pdf -biber -shell-escape -synctex=1 -interaction=nonstopmode " .. file
                        -- Obre un terminal horitzontal a sota que mostra l'output
                        vim.cmd("cd " .. vim.fn.fnameescape(dir))
                        vim.cmd("botright 15split | terminal " .. cmd)
                    end, "LaTeX compile")
                    map("<leader>lv", "<cmd>VimtexView<CR>",         "LaTeX view PDF")
                    map("<leader>le", "<cmd>VimtexErrors<CR>",       "LaTeX errors")
                    map("<leader>lc", "<cmd>VimtexClean<CR>",        "LaTeX clean aux")
                    map("<leader>lt", "<cmd>VimtexTocToggle<CR>",    "LaTeX TOC toggle")
                    map("<leader>lk", "<cmd>VimtexStop<CR>",         "LaTeX stop")
                end,
            })
        end,
    },

    {
        "micangl/cmp-vimtex",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "lervag/vimtex",
        },
        config = function()
            require("cmp").setup.filetype({ "tex", "latex" }, {
                sources = require("cmp").config.sources({
                    { name = "vimtex",   priority = 1000 },
                    { name = "nvim_lsp", priority = 750  },
                    { name = "luasnip",  priority = 500  },
                    { name = "path",     priority = 250  },
                }),
            })
        end,
    },
}
