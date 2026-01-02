-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function no_arrow()
	vim.notify("Use h/j/k/l instead!", vim.log.levels.WARN)
end

vim.keymap.set({ "n", "i", "v" }, "<Up>", no_arrow)
vim.keymap.set({ "n", "i", "v" }, "<Down>", no_arrow)
vim.keymap.set({ "n", "i", "v" }, "<Left>", no_arrow)
vim.keymap.set({ "n", "i", "v" }, "<Right>", no_arrow)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>nf", ":DogeGenerate<CR>", { desc = "Generate Docstring (Doge)" })
