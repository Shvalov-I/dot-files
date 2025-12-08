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
						style = "%H:%M",
					},
				},
			},
		},
	},
}
