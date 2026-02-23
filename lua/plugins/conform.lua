return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" }, -- Run :ConformInfo to see what's working
	opts = {
		formatters_by_ft = {
			python = { "black" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
