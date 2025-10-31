return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
			settings = {
				save_on_toggle = true,
			},
		},
		keys = function()
			local keys = {
				{
					"<leader>h",
					function()
						require("harpoon"):list():add()
					end,
					desc = "[H]arpoon File",
				},
				{
					"<leader>H",
					function()
						local harpoon = require("harpoon")
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "[H]arpoon Quick Menu",
				},
				{
					"<leader>j",
					function()
						require("harpoon"):list():select(1)
					end,
					desc = "Harpoon to File 1",
				},
				{
					"<leader>k",
					function()
						require("harpoon"):list():select(2)
					end,
					desc = "Harpoon to File 2",
				},
				{
					"<leader>l",
					function()
						require("harpoon"):list():select(3)
					end,
					desc = "Harpoon to File 3",
				},
				{
					"<leader>;",
					function()
						require("harpoon"):list():select(4)
					end,
					desc = "Harpoon to File 4",
				},
			}
			return keys
		end,
	},
}
