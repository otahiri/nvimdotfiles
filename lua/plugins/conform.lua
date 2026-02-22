return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- This triggers the plugin right before you save
	cmd = { "ConformInfo" }, -- Run :ConformInfo to see what's working
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			-- 1. For Python, use Black (it fixes most flake8 errors)
			python = { "black" },
			-- 2. For C at 1337, use clang-format
			c = { "c-formatter-42" },
			-- 3. Use a sub-list to run ONLY the first available (fallback)
			javascript = { { "prettierd", "prettier" } },
		},
		-- This is the "Magic" part: Format every time you save
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
