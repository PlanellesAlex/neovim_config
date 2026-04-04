return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- Afegir fitxer actual a harpoon
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
            { desc = "[H]arpoon [A]dd file" })

        -- Obrir el menú de harpoon
        vim.keymap.set("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "[H]arpoon menu" })

        -- Saltar als 4 primers fitxers marcats
        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })

	-- Eliminar el fitxer actual de la llista
	vim.keymap.set("n", "<leader>hd", function()
	    harpoon:list():remove()
	end, { desc = "[H]arpoon [D]elete file" })

	-- Eliminar tots els fitxers de la llista
	vim.keymap.set("n", "<leader>hx", function()
	    harpoon:list():clear()
	end, { desc = "[H]arpoon clear all" })
    end,
}
