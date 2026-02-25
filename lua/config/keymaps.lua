-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function lint()
  local name = vim.fn.expand("%:e")
  if name == "py" then
    vim.cmd("silent! %s/\\t/    /g")
  end
end

local function header()
  local name = vim.fn.expand("%:e")
  if name == "c" or name == "h" then
    vim.cmd("silent! Stdheader")
  end
end

vim.keymap.set("n", "<leader>w", function()
  vim.cmd("silent! w")
end)
vim.keymap.set("n", "<leader>q", function()
  vim.cmd("silent! q")
end)
vim.api.nvim_create_autocmd("BufWritePost", { callback = lint })
vim.keymap.set("n", "<F1>", header)
