local function lint()
  local name = vim.fn.expand '%:e'
  if name == 'py' then vim.cmd 'silent! %s/\\t/    /g' end
end

local function header()
  local name = vim.fn.expand '%:e'
  if name == 'c' or name == 'h' then vim.cmd 'silent! Stdheader' end
end

local function format()
  local name = vim.fn.expand '%:e'
  if name == 'c' or name == 'h' then
    vim.cmd 'silent! CFormat'
  elseif name == 'py' then
    vim.cmd 'silent! Format'
  end
end

vim.keymap.set('n', '<leader>w', function() vim.cmd 'silent! w' end)
vim.keymap.set('n', '<leader>q', function() vim.cmd 'silent! q' end)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
vim.api.nvim_create_autocmd('BufWritePost', { callback = lint })
vim.keymap.set('n', '<F1>', header)
vim.keymap.set('n', '<leader>cf', format)
vim.keymap.set('n', '<leader>e', function()
  local explorer = Snacks.picker.get({ source = 'explorer' })[1]
  if explorer then
    explorer:close()
  else
    Snacks.explorer.reveal()
  end
end)
vim.keymap.set('n', 'L', function() vim.cmd 'silent! BufferLineCycleNext' end)
vim.keymap.set('n', 'H', function() vim.cmd 'silent! BufferLineCyclePrev' end)
vim.keymap.set('n', '<F1>', header)

vim.keymap.set('n', '<leader>cl', function() Snacks.picker.lsp_config() end)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'K', function() return vim.lsp.buf.hover() end)
vim.keymap.set('n', 'gK', function() return vim.lsp.buf.signature_help() end)
vim.keymap.set('n', '<c-k>', function() return vim.lsp.buf.signature_help() end)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>cc', vim.lsp.codelens.run)
vim.keymap.set('n', '<leader>cC', vim.lsp.codelens.refresh)
vim.keymap.set('n', '<leader>cR', function() Snacks.rename.rename_file() end)
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)

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

vim.keymap.set({ "x", "o" }, "il", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end, { desc = "Select inner loop" })

vim.keymap.set({ "x", "o" }, "al", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end, { desc = "Select outer loop" })
