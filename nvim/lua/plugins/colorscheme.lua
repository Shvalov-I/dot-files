return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true

			local catppuccin = require("catppuccin")

			catppuccin.setup({
				flavour = "mocha",
				term_colors = true,
				transparent_background = true,
				styles = {
					comments = {},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					native_lsp = { enabled = true },
					telescope = true,
					treesitter = true,
					treesitter_context = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
