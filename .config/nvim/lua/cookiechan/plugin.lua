local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- Plugin to enable comments ('gc')
Plug('tpope/vim-commentary')

-- Autocomplete surround characters
Plug('jiangmiao/auto-pairs')

-- Surround
Plug('tpope/vim-surround')

-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

-- Color schemes
Plug('morhetz/gruvbox')

-- Git support
Plug('tpope/vim-fugitive')

-- --START-OF-LSP--
-- LSP: LSP Support
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- LSP: Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('saadparwaiz1/cmp_luasnip')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lua')

-- LSP: Snippets
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')

-- LSP: wrapper
Plug('VonHeikemen/lsp-zero.nvim')
-- ---END-OF-LSP---

vim.call("plug#end")
