return {
	{
		"stevearc/oil.nvim",
		dependencies = { 
			"nvim-tree/nvim-web-devicons",
			 "benomahony/oil-git.nvim",
		},
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hiden = true,
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
		end,
	},
}
