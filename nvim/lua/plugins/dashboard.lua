return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local logo = [[
    ⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣶⣦⣄⡀⢀⣀⣤⣤⣄
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣆⠀⠀⠀⠀⠀⠀⢀⣄⠙⢿⣿⣟⣿⣿⣿⣿⣿⠇
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡀⠀⠀⠀⠀⢀⣿⣿⡇⠀⠈⢹⡏⠉⠉⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⢸⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣷⣶⣶⣶⣷⣾⣿⣿⡀⠀⠀⢸⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⢉⠙⣿⣿⣿⣿⣿⠟⠛⢦⡀⣼⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠐⢒⣾⣿⣿⣷⡀⠛⢀⣿⣿⣿⣭⣿⣈⠛⣸⣧⣿⠤⠤⠀⠀⠀⠀
⠀⠀⠀⠠⠤⠒⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠤⠤⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠁⠀⠀⠀⠀⠈⠙⠻⣆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⡿⠋⢀⣠⣄⠀⠀⠶⠿⠦⠀⠰⠶⠹⣧⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡇⠀⠚⠉⠉⠀⠀⠀⠀⠀⣀⡀⠀⢀⣇⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠠⠾⠛⠂⠀⠘⠉⠉⠀⠉⢹⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠀
⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠀⠀⠀⠀⠀
⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠃⠀⠀⠀⠀⠀
⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⣀⠀⠀⠀⢀⣠⣴⣿⠏⠀⠀⠀⠀⠀⠀
⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠉⠉⠉⠉⠉⠉⠙⠛⠿⠿⠿⠿⠟⠛⠿⠿⠿⠿⠿⠇⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀	⠀]]
		logo = string.rep("\n", 8) .. logo .. "\n\n"
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = vim.split(logo, "\n"),
				week_header = {
					enable = false,
				},
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						action = "Telescope live_grep",
						desc = " Find text",
						icon = " ",
						key = "g",
					},
					{
						action = "qa",
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
