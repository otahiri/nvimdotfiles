return {
	{
		"sainnhe/everforest",
		lazy = false,
	},
	{
		"cocopon/iceberg.vim",
		lazy = false,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		config = function()
			-- Optional: Configure the theme before loading it
			require("nightfox").setup({
				transparent = true, -- Great for Hyprland/Kitty setup
			})

			-- Load the colorscheme
			vim.cmd([[colorscheme nightfox]])
		end,
	}
}
