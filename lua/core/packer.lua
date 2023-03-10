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

    -- Ranger within Vim
    use { "kevinhwang91/rnvimr" }

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

    -- Better tabline
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

    -- Winline with outline
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    })

    -- Syntax Highlight
    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use ('mrjones2014/nvim-ts-rainbow')
    use {'mechatroner/rainbow_csv'} -- CSV Rainbow

    -- Quick comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Auto close stuff
    use {
    	"windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use ('alvan/vim-closetag')

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
    use { 'simrat39/symbols-outline.nvim' }

    -- Better errors
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }

    -- Indent blocks
    use "lukas-reineke/indent-blankline.nvim"

    -- Terminal
    use 'voldikss/vim-floaterm'

    -- Startup screen
    use 'mhinz/vim-startify'

    -- Better command line
    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                -- add any options here
            })
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    })

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
