return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		-- Force compilation from source to avoid GLIBC mismatch
		require("nvim-treesitter.install").prefer_git = true

		-- Use a protected call to handle the "module not found" issue gracefully
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"rust",
				"markdown",
				"markdown_inline"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
					},
				},
			},
		})
	end,
}
