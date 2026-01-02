return {
	{
		"kkoomen/vim-doge",
	},
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = false,
        ruff_lsp = false,
      },
    },
  },
}

