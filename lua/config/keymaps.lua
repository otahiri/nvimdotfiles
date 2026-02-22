local function formatter()
	local name = vim.fn.expand("%:e")
	if name == "py" then
		vim.cmd("silent! %s/\\t/    /g")
	end
end

local function header()
	local name = vim.fn.expand("%:e")
	if name == "c" then
		vim.cmd("silent! Stdheader")
	end
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.api.nvim_create_autocmd("BufWritePost", {callback = formatter})
vim.keymap.set("n", "<F1>", header)
