
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.mousehide = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.breakindent = true
vim.o.virtualedit = "block"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.undofile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.termguicolors = true
vim.o.inccommand = "split"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.opt.shortmess:append("I")
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	callback = function()
		local excluded_filetypes = { "txt", "tex", "markdown", "md", "dashboard"}
		local current_filetype = vim.bo.filetype

		-- Check if current filetype is in the excluded list
		for _, ft in ipairs(excluded_filetypes) do
			if current_filetype == ft then
				vim.opt_local.colorcolumn = ""
				return
			end
		end

		-- Original logic for other filetypes
		local line_len = vim.fn.col("$") - 1
		if line_len > 70 then
			vim.opt_local.colorcolumn = "80"
		else
			vim.opt_local.colorcolumn = ""
		end
	end,
})
vim.o.scrolloff = 15
vim.o.sidescrolloff = 10
vim.o.confirm = true



-- Set up diagnostics

vim.diagnostic.config({
    virtual_text = true, -- que et surti l'error al final de la linia on hi ha l'error
    virtual_lines = false, -- que et surti l'error a sota de la linia on hi ha l'error
			    -- com un subratllat
    update_in_insert = false,
    float = {border = "rounded"},


}) -- vim.diagnostic.config()

 -- Neovim's built-in diagnostic re-show only hooks InsertLeave, which <C-c> skips.
 -- ModeChanged with i*:n* fires for both <Esc> and <C-c>.
 vim.api.nvim_create_autocmd("ModeChanged", {
     pattern = "i*:n*",
     callback = function()
         vim.diagnostic.show(nil, 0)
     end,
 })

 -- Also re-render when the LSP publishes diagnostics after we've left insert mode
 -- (handles slow LSPs that send results after the mode transition).
 vim.api.nvim_create_autocmd("DiagnosticChanged", {
     callback = function()
         if not vim.api.nvim_get_mode().mode:find("^i") then
             vim.diagnostic.show(nil, 0)
         end
     end,
 })
