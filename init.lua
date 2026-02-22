require("config.keymaps")
require("config.lazy")
require('mini.pairs').setup({})
require('mini.surround').setup()
require('mini.keymap').setup()
require('mini.completion').setup()
vim.opt.clipboard = "unnamedplus"
vim.diagnostic.config({
  virtual_text = {
    source = "always",
    prefix = '●',
  },
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
})
vim.opt.undofile = true
vim.opt.relativenumber = true
