vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "[C]hange [D]irectory" })



vim.keymap.set("n", "<C-n>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-p>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-m>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "ww", "<C-w>")
vim.keymap.set("n", "wwr", "<C-w>x") -- Swap current window with previous

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("v", "++", '"+y', {desc = "Yank to system clipboard"})

vim.keymap.set("n", "<leader>w", function()
    vim.cmd("w")
    vim.notify("Saved Current Buffer to memory", vim.log.levels.INFO, {title="Save"})
end,

{ desc = "Save current buffer to memory" })



vim.keymap.set("n", "o", "zzo", { desc = "Center page before entering a new line below cursor" })
vim.keymap.set("n", "O", "zzO", { desc = "Center page before entering a new line above cursor" })
vim.keymap.set("n", "G", "zzG", { desc = "Center page before going to end of file" })
vim.keymap.set("n", "}", "zz}", { desc = "Center page before going to next paragraph" })
vim.keymap.set("n", "{", "zz{", { desc = "Center page before going to previous paragraph" })
vim.keymap.set({ "i", "v" }, "jj", "<Esc>", { desc = "Enter normal mode" })

-- Override gc to Ctrl+ç to toggle comment and more advanced commenting actions
vim.keymap.set({ "n", "v" }, "<C-ç>", "gc", { remap = true, desc = "Toggle comment" })

-- Toggle diagnostics on/off
vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "[T]oggle [D]iagnostics" })

-- Dismiss Noice Messages (plugin de la floatingcmd.lua)
vim.keymap.set("n", "<leader>tm", "<cmd>NoiceDismiss<CR>", {desc = "[T]oggle Noice [M]essage"})

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Return to normal mode in terminal"})

