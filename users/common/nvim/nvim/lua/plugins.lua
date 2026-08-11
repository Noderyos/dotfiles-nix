local gh = function(x)
    return 'https://github.com/' .. x
end

local plugins = {
    gh('Aietes/esp32.nvim'),
    gh('maxbane/vim-asm_ca65'),

    -- lsp-config
    gh('neovim/nvim-lspconfig'),
    gh('mfussenegger/nvim-jdtls'),
    gh('onsails/lspkind-nvim'),
    gh('rmagatti/goto-preview'),
    gh('ray-x/lsp_signature.nvim'),
    gh('WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'),
    gh('williamboman/mason.nvim'),
    gh('williamboman/mason-lspconfig.nvim'),

    -- cmp
    gh('hrsh7th/cmp-nvim-lsp'),
    gh('hrsh7th/cmp-buffer'),
    gh('hrsh7th/cmp-path'),
    gh('hrsh7th/nvim-cmp'),
    gh('rafamadriz/friendly-snippets'),

    -- vsnip
    gh('hrsh7th/vim-vsnip'),
    gh('marko-cerovac/material.nvim'),

    -- treesitter
    gh('nvim-treesitter/nvim-treesitter'),
    gh('rush-rs/tree-sitter-asm'),
    gh('windwp/nvim-ts-autotag'),

    gh('nvim-neotest/nvim-nio'),
    gh('Pocco81/auto-save.nvim'),
    gh('lewis6991/gitsigns.nvim'),

    -- platformio
    gh('anurag3301/nvim-platformio.lua'),
    gh('akinsho/toggleterm.nvim'),
    gh('nvim-telescope/telescope.nvim'),
    gh('nvim-telescope/telescope-ui-select.nvim'),
    gh('nvim-lua/plenary.nvim'),

    {
        src = gh('vhyrro/luarocks.nvim'),
        priority = 1000,
        config = true,
    },
    {
        src = gh('sainnhe/sonokai'),
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_enable_italic = true
            vim.cmd.colorscheme('sonokai')
        end
    }
}
vim.pack.add(plugins)