-- La manera manual de tenir lsp es fer un vim.lsp.start({}) de fet pots fer
-- :h vim.lsp.start() i veus que:
        -- vim.lsp.start({
        --    name = 'my-server-name',
        --    cmd = {'name-of-language-server-executable'},
        --    root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py'}),
        -- })
-- Aleshores aqui et descarregues el server lsp i poses el directory on el
-- tens descarregat, per exemlpe el lsp de C es clangd, el busco a internet
-- me'l descarrego i el tinc a ~/home/users/clangd-data/clangd.exe

-- vim.lsp.start({
--     name = "clangd",
--     cmd = {"~/home/users/clangd-data/clangd.exe"},
--     root_dir = "dir del root directory del teu project",
-- })
--
-- i ja ho tindria. pero hi ha allò de que t'has d'esperar a que el buffer 
-- s'obri i després carregar el lsp perue sino no funciona bé i per tant en 
-- realitat fas:
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
-- 	vim.lsp.start({
-- 	    name = "clangd",
-- 	    cmd = {"path"},
-- 	    root_dir = {"root_dir_path"},
-- 	})
--     end,
-- )}
--
-- Clar però aqui no tens ni configuració del lsp ni res, si el vols configurar
-- Hauries de fer mil coses més.
-- Per això tenim plugins que fan aquestes coses per nosaltres
-- Aquest plugin és nvim-lspconfig
-- Igualment ara ens hauriem d'instal·lar manualment els language servers
-- Per això entra MASON que ens els instal·la automàticament si no els tenim


return {

    -- Mason: instal·la automàticament els executables dels LSP servers
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed   = "✓",
                    package_pending     = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- Mason-lspconfig: pont entre mason i lspconfig + configuració dels LSPs
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",  -- Python (ja instal·lat)
                    "clangd",   -- C / C++
		    "neocmake", -- cmake 
                },
                automatic_installation = true,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
	    capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" },
            }

            -- ── Python ────────────────────────────────────────────────────
	    -- Detecta automàticament el venv del projecte:
            -- busca .venv/ o venv/ a l'arrel, sinó fa servir el python global
            local function get_python_path()
                local venv_paths = { ".venv", "venv", ".env" }
                local cwd = vim.fn.getcwd()
                for _, venv in ipairs(venv_paths) do
                    local python = cwd .. "/" .. venv .. "/Scripts/python.exe" -- Windows
                    if vim.fn.filereadable(python) == 1 then
                        return python
                    end
                    local python_unix = cwd .. "/" .. venv .. "/bin/python" -- Linux/Mac
                    if vim.fn.filereadable(python_unix) == 1 then
                        return python_unix
                    end
                end
                return vim.fn.exepath("python") or vim.fn.exepath("python3") or "python"
            end


            vim.lsp.config("pyright", {
                capabilities = capabilities,
		before_init = function(_, config)
		    config.settings.python.pythonPath = get_python_path()
		end,
                settings = {
                    pyright = {
                        autoImportCompletions = true,
                    },
                    python = {
                        analysis = {
                            typeCheckingMode       = "standard",
                            autoSearchPaths        = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode         = "openFilesOnly",
			    indexing = true,
                        },
                    },
                },
            })
            vim.lsp.enable("pyright")

            -- ── C / C++ ───────────────────────────────────────────────────
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--suggest-missing-includes",
		    "--compile-commands-dir=build",
                },
            })
            vim.lsp.enable("clangd")

	    -- ── CMake ──────────────────────────────────
	    vim.lsp.config("neocmake", {
		capabilities = capabilities,
	    })
	    vim.lsp.enable("neocmake")


            -- ── Keymaps (només quan un LSP s'adjunta a un buffer) ─────────
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach-keymaps", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd",         vim.lsp.buf.definition,    "[G]oto [D]efinition")
                    map("gr",         vim.lsp.buf.references,     "[G]oto [R]eferences")
                    map("gI",         vim.lsp.buf.implementation, "[G]oto [I]mplementation")
                    map("gy",         vim.lsp.buf.type_definition,"[G]oto T[y]pe definition")
                    map("K",          vim.lsp.buf.hover,          "Hover documentation")
                    map("<leader>ca", vim.lsp.buf.code_action,    "[C]ode [A]ction")
                    map("<leader>rn", vim.lsp.buf.rename,         "[R]e[n]ame")
                    map("<leader>fs", function()
                        vim.opt_local.tabstop     = 4
                        vim.opt_local.shiftwidth  = 4
                        vim.opt_local.expandtab   = true
                        vim.lsp.buf.format()
                    end, "[F]ormat [S]ource")
                end,
            })

        end, -- config
    },

} -- return
	-- dependencies = {
	--     {"williamboman/mason.nvim"},
	--     {"mason-org/mason.nvim", opts = {}},
	--     {"mason-org/mason-lspconfig.nvim"},
	--     {
	-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 	opts = {
	-- 	    ensure_installed = {
	-- 		"lua_ls",
	-- 		"basedpyright",
	-- 		"rust_analyzer",
	-- 		"stylua",
	-- 		"prettier",
	-- 		"black",
	-- 	    }, -- ensure_installed
	-- 	}, -- opts
	--     }, -- "WhoIsSethDaniel/mason-tool-installer.nvim"
	-- }, --dependencies
    --}, -- neovim/nvim-lspconfig


