local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "LinArcX/telescope-command-palette.nvim" }

    -- Themes
    use 'sainnhe/gruvbox-material'
    use 'ellisonleao/gruvbox.nvim'
    use 'dracula/vim'
    use 'olimorris/onedarkpro.nvim'

    -- Git
    use 'airblade/vim-gitgutter' -- Git status in gutter
    use 'tpope/vim-fugitive'

    -- File Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Better status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Better buffer line
    --use {
    --    'akinsho/bufferline.nvim',
    --    tag = "v3.*",
    --    requires = 'nvim-tree/nvim-web-devicons'
    --}

    -- Syntax Highlight
    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {'mechatroner/rainbow_csv'} -- CSV Rainbow

    -- Shortcuts Helper
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }

    -- LSP Servers
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- Outline
    use 'simrat39/symbols-outline.nvim'

    -- Better errors
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }

    -- Terminal
    use 'voldikss/vim-floaterm'

    -- Startup screen
    use 'mhinz/vim-startify'

    -- Active mode in line indicator
    use {
        'mawkler/modicator.nvim',
        after = 'gruvbox-material', -- Add your colorscheme plugin here
        setup = function()
            -- These are required for Modicator to work
            vim.o.cursorline = true
            vim.o.number = true
            vim.o.termguicolors = true
        end,
        config = function()
            require('modicator').setup({
                -- ...
            })
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
