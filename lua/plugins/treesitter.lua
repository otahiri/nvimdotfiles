return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    -- Force compilation from source to avoid GLIBC mismatch
    require("nvim-treesitter.install").prefer_git = true

    -- Use a protected call to handle the "module not found" issue gracefully
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      -- Recommended to ensure these are always present
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "rust",
        "markdown",
        "markdown_inline"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ib"] = "@block.inner",
            ["ab"] = "@block.outer",
          },
        },
      },
    })
  end,
}
