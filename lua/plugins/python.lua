return {
  -- Disable Ruff completely
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

