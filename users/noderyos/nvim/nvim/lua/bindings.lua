keymap = vim.keymap.set

-- Other bindings
keymap('n', '[[',              '<cmd> vertical resize +7 <cr>')
keymap('n', ']]',              '<cmd> vertical resize -7 <cr>')
keymap('n', '+',               '<cmd> resize +1 <cr>')
keymap('n', '-',               '<cmd> resize -1 <cr>')
keymap("n", "<Leader>pv", '<cmd> Explore <cr>')

-- goto-preview bindings
keymap('n', 'gd', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>')
keymap('n', 'gt', '<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>')
keymap('n', 'gi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>')
keymap('n', 'gD', '<cmd>lua require("goto-preview").goto_preview_declaration()<CR>')
keymap('n', '`',  '<cmd>lua require("goto-preview").close_all_win()<CR>')
keymap('n', 'gr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>')


-- LSP bindings
keymap('n', 'ggD',        '<cmd> lua vim.lsp.buf.declaration() <cr>')
keymap('n', 'ggd',        '<cmd> lua vim.lsp.buf.definition() <cr>')
keymap('n', 'K',         '<cmd> lua vim.lsp.buf.hover() <cr>')
keymap('n', 'ggi',        '<cmd> lua vim.lsp.buf.implementation() <cr>')
keymap('n', '<space>D',  '<cmd> lua vim.lsp.buf.type_definition() <cr>')
keymap('n', '<space>rn', '<cmd> lua vim.lsp.buf.rename() <cr>')
keymap('n', '<space>ca', '<cmd> lua vim.lsp.buf.code_action() <cr>')
keymap('n', 'ggr',        '<cmd> lua vim.lsp.buf.references() <cr>')

-- Binding to swtich to normal mode in terminal, press <Esc> two times
vim.cmd(':tnoremap <Esc><Esc> <C-\\><C-n>')