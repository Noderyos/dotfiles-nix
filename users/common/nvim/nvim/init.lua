-- include plugins and their config
require('plugins')
require('plug_config.treesitter')
require('plug_config.colour')
require('plug_config.lsp_config.lsp-cmp')
require('plug_config.lsp_config.lsp-config')
require('plug_config.lsp_config.mason')
require('plug_config.lsp_config.lsp-signature')
require('plug_config.lsp_config.goto-preview')
require('plug_config.gitsigns')
require('plug_config.autosave')
require('plug_config.pio')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('general')
require('bindings')
require('commands')
-- Emmet configuration
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
