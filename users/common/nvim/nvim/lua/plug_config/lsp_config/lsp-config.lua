local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {'pylsp', 'hls', 'lua_ls', 'bashls', 'marksman', 'asm_lsp'}

for _, lsp in ipairs(servers) do
    vim.lsp.config[lsp] = vim.tbl_deep_extend('force', vim.lsp.config[lsp] or {}, {
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },

        root_dir = vim.fn.getcwd,
    })

    vim.lsp.enable(lsp)
end

vim.lsp.config.clangd = vim.tbl_deep_extend('force', vim.lsp.config.clangd or {}, {
    capabilities = capabilities,
})
vim.lsp.enable('clangd')

vim.lsp.config.pylsp = vim.tbl_deep_extend('force', vim.lsp.config.pylsp or {}, {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 100
                }
            }
        }
    }
})