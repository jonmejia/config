return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					never_show = {
						".DS_Store",
						".git",
						"node_modules",
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left toggle=true <CR>", {})
	end,
}
