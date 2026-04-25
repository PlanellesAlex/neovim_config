vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.filetype.add({
    filename = {
	["justfile"] = "just",
	[".gitignore"] = "gitignore",
    },
})

local function apply_terminal_hl()
    local p = require("config.colorpalette")
    vim.api.nvim_set_hl(0, "TermNormal", { fg = p.terminal_fg, bg = p.bg_float })
    vim.defer_fn(function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })
            if bt == "terminal" then
                vim.api.nvim_win_set_option(win, "winhighlight",
                    "Normal:TermNormal,NormalNC:TermNormal")
            end
        end
    end, 10)
end

vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter" }, {
    callback = function()
        local bt = vim.api.nvim_get_option_value("buftype", { buf = 0 })
        if bt == "terminal" then
            apply_terminal_hl()
        end
    end,
})
