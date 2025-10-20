local plugins = {
    { "Aietes/esp32.nvim" },
    { 'maxbane/vim-asm_ca65' },
    {
        "neovim/nvim-lspconfig",
        'mfussenegger/nvim-jdtls',
        'onsails/lspkind-nvim',
        'rmagatti/goto-preview',
        'ray-x/lsp_signature.nvim',
        'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'rafamadriz/friendly-snippets'
    },

    {
        'hrsh7th/vim-vsnip',
        'marko-cerovac/material.nvim',
    },

    {
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter-refactor',
        'rush-rs/tree-sitter-asm',
        'windwp/nvim-ts-autotag',
    },
    {
        'nvim-neotest/nvim-nio',
    },
    {'Pocco81/auto-save.nvim'},
    {'lewis6991/gitsigns.nvim'},
    {
        "anurag3301/nvim-platformio.lua",
        dependencies = {
            { 'akinsho/toggleterm.nvim' },
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { "nvim-lua/plenary.nvim" },
        },
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
}

require("lazy").setup(plugins, opts)
