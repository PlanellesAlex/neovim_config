return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = false, -- no interfereix amb / i ?
            },
	    char = {
		enabled = false, -- no interfereix amb f, F, t, T, ;
	    }
        },
    },
    keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash jump" },
        { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,             desc = "Flash remote" },
        { "<C-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Flash toggle search" },
    },
}
