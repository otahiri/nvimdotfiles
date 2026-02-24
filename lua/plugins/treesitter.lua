return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		-- Auto-install parsers
		require("nvim-treesitter.install").compilers = { "gcc", "clang" }
		
		require("nvim-treesitter").setup({
			ensure_installed = {
				"c", "lua", "vim", "vimdoc", "query", "python",
				"rust", "markdown", "markdown_inline"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})

		-- Setup textobjects
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
			},
			move = {
				set_jumps = true,
			},
		})

		-- Text object keymaps
		vim.keymap.set({ "x", "o" }, "aa", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
		end, { desc = "Select outer parameter" })
		
		vim.keymap.set({ "x", "o" }, "ia", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
		end, { desc = "Select inner parameter" })

		vim.keymap.set({ "x", "o" }, "af", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end, { desc = "Select outer function" })
		
		vim.keymap.set({ "x", "o" }, "if", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end, { desc = "Select inner function" })
		
		vim.keymap.set({ "x", "o" }, "ac", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end, { desc = "Select outer class" })
		
		vim.keymap.set({ "x", "o" }, "ic", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end, { desc = "Select inner class" })

		-- Movement keymaps
		vim.keymap.set({ "n", "x", "o" }, "]m", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
		end, { desc = "Next function start" })
		
		vim.keymap.set({ "n", "x", "o" }, "]]", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
		end, { desc = "Next class start" })
		
		vim.keymap.set({ "n", "x", "o" }, "]M", function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
		end, { desc = "Next function end" })
		
		vim.keymap.set({ "n", "x", "o" }, "][", function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
		end, { desc = "Next class end" })
		
		vim.keymap.set({ "n", "x", "o" }, "[m", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
		end, { desc = "Previous function start" })
		
		vim.keymap.set({ "n", "x", "o" }, "[[", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
		end, { desc = "Previous class start" })
		
		vim.keymap.set({ "n", "x", "o" }, "[M", function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
		end, { desc = "Previous function end" })
		
		vim.keymap.set({ "n", "x", "o" }, "[]", function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
		end, { desc = "Previous class end" })
	end,
}
