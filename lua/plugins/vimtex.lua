return {
    'lervag/vimtex',
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
        vim.g.vimtex_view_method = 'general' -- Use SumatraPDF for pdf view
        vim.g.vimtex_compiler_method = 'latexmk' -- Use the .latexmkrc file
        vim.g.vimtex_quickfix_ignore_filters = {
            'translations-basic-dictionary-catalan',
	} -- ignore warning: catalan not appearing in siunix package.
    end
}

