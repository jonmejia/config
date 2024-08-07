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
		wk.add(
			{
				-- Code related mappings
				{ "<leader>c",  group = "code" },
				{ "<leader>ca", desc = "Code Actions" },
				{ "<leader>cd", desc = "Define" },
				{ "<leader>cf", desc = "Format" },
				{ "<leader>cl", desc = "Lint" },

				-- Toggle file tree
				{ "<leader>e",  ":Neotree filesystem reveal left toggle=true <CR>", desc = "Toggle File Tree" },

				-- File related mappings
				{ "<leader>f",  group = "file" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>",                       desc = "Search Buffers" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>",                    desc = "Find File" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>",                     desc = "Find Text" },
			}
		)
	end,
}
