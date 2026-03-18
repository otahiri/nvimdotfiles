return {
	"sainnhe/everforest",
	"cocopon/iceberg.vim",
	"marko-cerovac/material.nvim",
	"oahlen/iceberg.nvim",
	"rose-pine/neovim",
	"gbprod/nord.nvim",
	"gnfisher/tomorrow-night-blue.nvim",
	"rebelot/kanagawa.nvim",
	"atmosuwiryo/vim-winteriscoming",
	"oxfist/night-owl.nvim",
	"jpwol/thorn.nvim",
	"daschw/leaf.nvim",
	"0xstepit/flow.nvim",
	"yonlu/omni.vim",
	"catppuccin/nvim",
	"blazkowolf/gruber-darker.nvim",
	"markvincze/panda-vim",
	"matarina/pyrola.nvim",
	"Mofiqul/dracula.nvim",
	"tiagovla/tokyodark.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	"Ureakim/nebulae.nvim",
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
