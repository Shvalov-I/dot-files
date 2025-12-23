return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
			{ "nvim-telescope/telescope-file-browser.nvim", enabled = true },
		},
		config = function()
			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					file_browser = {
						path = "%:p:h", -- open from within the folder of your current buffer
						display_stat = false, -- don't show file stat
						grouped = true, -- group initial sorting by directories and then files
						hide_parent_dir = true, -- hide `../` in the file browser
						hijack_netrw = true, -- use telescope file browser when opening directory paths
						prompt_path = true, -- show the current relative path from cwd as the prompt prefix
						use_fd = true, -- use `fd` instead of plenary, make sure to install `fd`
					},
					defaults = {
						mappings = {
							i = {
								["<C-p>"] = require("telescope.actions.layout").toggle_preview,
							},
							n = {
								["<C-p>"] = require("telescope.actions.layout").toggle_preview,
							},
						},
					},
					pickers = {
						lsp_document_symbols = {
							symbol_width = 50,
						},
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			pcall(require("telescope").load_extension, "file_browser")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sF", function()
				builtin.find_files({
					hidden = true,
					no_ignore = true,
				})
			end, { desc = "[S]earch All [F]iles (Hidden + Gitignore)" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", function()
				require("telescope.builtin").buffers({
					sort_mru = true,
					ignore_current_buffer = true,
				})
			end, { desc = "[ ] Find existing buffers" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })

			-- Shortcuts for File Browser
			local fb_state = { toggle_both = false }

			local function toggle_gitignore_hidden(prompt_bufnr)
				fb_state.toggle_both = not fb_state.toggle_both
				local opts = require("telescope.actions.state").get_current_picker(prompt_bufnr):get_picker_opts()
				opts.hidden = { file_browser = fb_state.toggle_both, folder_browser = fb_state.toggle_both }
				opts.no_ignore = fb_state.toggle_both
				opts.respect_gitignore = not fb_state.toggle_both
				require("telescope.actions").close(prompt_bufnr)
				require("telescope.builtin").file_browser(opts)
			end

			vim.keymap.set("n", "<space>-", function()
				require("telescope").extensions.file_browser.file_browser({
					mappings = {
						i = { ["<C-h>"] = toggle_gitignore_hidden },
						n = { ["<C-h>"] = toggle_gitignore_hidden },
					},
				})
			end, { desc = "File Browser" })
		end,
	},
}
