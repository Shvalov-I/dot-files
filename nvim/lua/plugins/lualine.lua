return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_y = {
					"location",
				},
				lualine_z = {
					{
						"datetime",
						-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
						style = "%H:%M:%S",
					},
				},
			},
		},
	},
}
