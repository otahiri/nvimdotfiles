require("config.keymaps")
require("config.lazy")
require("mini.pairs").setup({})
require("mini.surround").setup()
require("mini.keymap").setup()
require("mini.completion").setup()
vim.opt.clipboard = "unnamedplus"
vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = "●",
	},
	float = {
		source = "always",
		border = "rounded",
	},
	signs = true,
})
vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.api.nvim_create_autocmd("TextYankPost", {callback = function () vim.highlight.on_yank() end,})
-- this line is for the python formatter
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
