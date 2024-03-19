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
					f = { "<cmd>Telescope find_files<cr>", "fzf" },
					g = { "<cmd>Telescope live_grep<cr>", "grep" },
					r = { "<cmd>Telescope oldfiles<cr>", "open recent" },
					b = { "<cmd>Telescope buffers<cr>", "search open buffers" },
				},
				c = {
					name = "+code",
					a = {"code actions"},
					d = {"define"},
					f = {"format"},

				},

				e = { ":Neotree filesystem reveal left toggle=true <CR>", "toggle file tree" },
			},
		})
	end,
}
