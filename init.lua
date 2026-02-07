-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
    -- Put your transparency here
    vim.g.neovide_window_opacity = 0.8
    vim.g.neovide_window_blurred = true
    -- Set a nice font that looks good with transparency
    vim.o.guifont = "Shanns_Comic_Font:h12"
end
