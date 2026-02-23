local function lint()
	local name = vim.fn.expand("%:e")
	if name == "py" then
		vim.cmd("silent! %s/\\t/    /g")
	end
end

local function header()
	local name = vim.fn.expand("%:e")
	if name == "c" or name == 'h' then
		vim.cmd("silent! Stdheader")
	end
end

local function format()
	local name = vim.fn.expand("%:e")
	if name == "c" or name == 'h' then
		vim.cmd("silent! CFormat")
	elseif name == "py" then
		vim.cmd("silent! Format")
	end
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", function () vim.cmd("silent! w") end)
vim.keymap.set("n", "<leader>q",function () vim.cmd("silent! q") end)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlight" })
vim.api.nvim_create_autocmd("BufWritePost", { callback = lint })
vim.keymap.set("n", "<F1>", header)
vim.keymap.set("n", "<leader>f", format)
vim.keymap.set("n", "<leader>e", function ()
	local explorer = Snacks.picker.get({source = "explorer"})[1]
	if explorer then
		if explorer:is_focused() then
			explorer:close()
		else
			explorer: focus()
		end
	else
		Snacks.explorer.reveal()
	end
	end)
vim.keymap.set("n", "L", function () vim.cmd("silent! BufferLineCycleNext") end)
vim.keymap.set("n", "H", function () vim.cmd("silent! BufferLineCyclePrev") end)
