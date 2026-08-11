local ensure_installed = {
  'c', 'cpp', 'python', 'lua', 'regex', 'bash',
  'comment', 'make', 'json', 'vim', 'asm'
}

local installed = require('nvim-treesitter.config').get_installed()
local to_install = vim.iter(ensure_installed)
  :filter(function(parser) return not vim.tbl_contains(installed, parser) end)
  :totable()

if #to_install > 0 then
  require('nvim-treesitter').install(to_install)
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

require('nvim-ts-autotag').setup({
  enable = true,
})

vim.keymap.set('n', 'grr', function()
  vim.lsp.buf.rename()
end, { desc = 'Smart Rename (LSP)' })