local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {'pyright', 'hls', 'lua_ls', 'bashls', 'marksman', 'asm_lsp'}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        root_dir = function() return vim.loop.cwd() end
    }
end

nvim_lsp['ccls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    init_options = {
        cache = {
            directory = "/tmp/ccls-cache"
        }
    },
    root_dir = function() return vim.loop.cwd() end
}

