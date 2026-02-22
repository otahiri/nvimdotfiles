return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 1. Mason setup remains the same
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "pyright", "rust_analyzer" },
    })

    -- 2. Setup Mini Modules
    require('mini.completion').setup({})
    require('mini.pairs').setup({})
    require('mini.keymap').setup({})
    local minikeyword = require('mini.keymap')
    minikeyword.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })

    -- 3. The New 0.11 Way: vim.lsp.config
    -- Setting up clangd with the UTF-16 offset fix
    vim.lsp.config("clangd", {
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      root_markers = { ".git", "Makefile", "compile_commands.json" },
      capabilities = {
        offsetEncoding = { "utf-16" },
      },
    })

    -- Enable the servers
    vim.lsp.enable({ "clangd", "pyright", "rust_analyzer" })

    -- 4. LSP Attach: Keymaps (gd, gr, etc.)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local opts = { buffer = args.buf, silent = true }
        
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition", buffer = args.buf })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to Declaration", buffer = args.buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Show References", buffer = args.buf })
        vim.keymap.set('n', 'K',  vim.lsp.buf.hover,      { desc = "Hover Documentation", buffer = args.buf })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename Symbol", buffer = args.buf })
      end,
    })

    -- 5. Modern Diagnostic UI
    vim.diagnostic.config({
      virtual_text = { prefix = "●", source = "if_many" },
      signs = true,
      underline = true,
      severity_sort = true,
      float = { border = "rounded", source = "always" },
    })

    -- Signs definitions (using the new sign_define approach or global vim.diagnostic)
    local signs = { Error = "󰅚 ", Warn = "󰀦 ", Hint = "󰌵 ", Info = "󰋽 " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end
}
