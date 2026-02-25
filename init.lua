-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").clangd.setup({
  settings = {
    -- This tells the server never to send hint data to Neovim
    clangd = {
      InlayHints = {
        Designators = false,
        Enabled = false,
        ParameterNames = false,
        DeducedTypes = false,
      },
    },
  },
})
