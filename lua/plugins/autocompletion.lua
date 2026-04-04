return {

    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "lukas-reineke/cmp-under-comparator", -- millor ordenació per relevància
    },

    config = function()
        local cmp      = require("cmp")
        local luasnip  = require("luasnip")
        local compare  = require("cmp.config.compare")

        require("luasnip.loaders.from_vscode").lazy_load()
	
	local p = require("config.colorpalette")
	local function set_cmp_hl()
            vim.api.nvim_set_hl(0, "CmpNormal", { bg = p.bg_float })
            vim.api.nvim_set_hl(0, "CmpBorder", { fg = p.cursor,   bg = p.bg_float })
	    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = p.purple_bright, bg = p.bg_float })
            vim.api.nvim_set_hl(0, "CmpSel",    { fg = p.white,    bg = p.bg_float_sel, bold = true })
        end
        vim.schedule(set_cmp_hl)
        vim.api.nvim_create_autocmd("ColorScheme", { callback = set_cmp_hl })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- ── Fonts ─────────────────────────────────────────────────────
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 },
                { name = "luasnip",  priority = 750  },
                { name = "path",     priority = 500  },
            }),

            -- ── Ordenació: el LSP mana, sort_text és el que pyright usa
            --    per posar pandas abans que print en un context d'import ───
            sorting = {
                priority_weight = 2,
                comparators = {
                    compare.exact,       -- coincidència exacta primer
                    compare.score,       -- puntuació de coincidència
                    compare.sort_text,   -- pyright ordena per sort_text segons context
                    require("cmp-under-comparator").under, -- dunder methods al final
                    compare.recently_used,
                    compare.locality,
                    compare.kind,
                    compare.length,
                    compare.order,
                },
            },

            -- ── Auto-import: aplica els canvis addicionals que envia pyright
            --    (afegir la línia d'import al capdamunt del fitxer) ─────────
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },

            -- ── Aparença ───────────────────────────────────────────────────
            formatting = {
                format = function(entry, item)
                    local source_names = {
                        nvim_lsp = "[LSP]",
                        luasnip  = "[Snip]",
                        path     = "[Path]",
                        cmdline  = "[Cmd]",
                    }
                    item.menu = source_names[entry.source.name] or ""
                    return item
                end,
            },

            -- ── Keymaps ────────────────────────────────────────────────────
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Esc>"]     = cmp.mapping.abort(),
                ["<C-y>"]      = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace, -- aplica additionalTextEdits (auto-import)
                    select = false,
                }),
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
		["<C-d>"] = cmp.mapping.scroll_docs(4),   -- scroll docs avall
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),  -- scroll docs amunt
            }),

            preselect = cmp.PreselectMode.None,

	    window = {
                completion = {
                    winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
                    border       = "rounded",
                    scrollbar    = true,
                    col_offset   = 1,
                    side_padding = 1,
                },
                documentation = {
                    winhighlight = "Normal:CmpNormal,FloatBorder:CmpDocBorder",
                    border       = "rounded",
                    scrollbar    = true,
                    col_offset   = 1,
                    side_padding = 1,
                },
            },
        })

        -- Command line
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path"    },
                { name = "cmdline" },
            }),
        })

    end,
}



-- return {
--
--     {"hrsh7th/nvim-cmp"},
--     {"hrsh7th/cmp-nvim-lsp"},
--     {"L3MON4D3/LuaSnip"},
--     {"rafamadriz/friendly-snippets"},
--     {"hrsh7th/cmp-path"},
--     {"hrsh7th/cmp-cmdline"},
--     {"saadparwaiz1/cmp_luasnip"},
--
--
-- } -- return
