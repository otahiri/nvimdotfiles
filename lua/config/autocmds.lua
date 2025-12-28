-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("set noexpandtab")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.expandtab = false
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.b.autoformat = false
  end,
})
--
vim.api.nvim_create_user_command("W", "w", {})
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
