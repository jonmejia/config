return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				f = {
					name = "+file",
					f = { "<cmd>Telescope find_files<cr>", "Find File" },
					g = { "<cmd>Telescope live_grep<cr>", "Find Text" },
					r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
					n = { "<cmd>enew<cr>", "New File" },
					b = { "<cmd>Telescope buffers<cr>", "Search Open Buffers" },
				},
				c = {
					name = "+code",
					a = {"Code Actions"},
					d = {"Define"},
					f = {"Format"},

				},

				e = { ":Neotree filesystem reveal left toggle=true <CR>", "Toggle File Tree" },
			},
		})
	end,
}
