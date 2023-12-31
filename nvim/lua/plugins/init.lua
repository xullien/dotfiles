local lazy = require("lazy")

local plugins = {
    "nvim-lua/plenary.nvim",

    -- colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeFindFileToggle","NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    -- icons, for UI related plugins
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },

    -- syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            'windwp/nvim-ts-autotag',
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.configs.treesitter")
        end,
    },

    -- buffer + tab line
    {
        "akinsho/bufferline.nvim",
        -- lazy = false,
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require("plugins.configs.bufferline")
        end,
    },

    -- statusline

    {
        "echasnovski/mini.statusline",
        lazy = false,
        config = function()
            require("mini.statusline").setup({ set_vim_settings = false })
        end,
    },
    { 
        'echasnovski/mini.cursorword', 
        event = {"BufReadPre", "BufNewFile"},
        version = false,
        config = function()
            require('mini.cursorword').setup()
        end,
    },

    { 
        'echasnovski/mini.indentscope', 
        event = {"BufReadPre", "BufNewFile"},
        version = false,
        config = function()
            require('mini.indentscope').setup()
        end,
    },
    { 
        'echasnovski/mini.move', 
        event = {"BufReadPre", "BufNewFile"},
        version = false,
        config = function()
            require('mini.move').setup()
        end,
    },
    { 
        'echasnovski/mini.pairs', 
        event = {"BufReadPre", "BufNewFile"},
        version = false,
        config = function()
            require('mini.pairs').setup()
        end,
    },
    {
        'echasnovski/mini.splitjoin',
        event = {"BufReadPre", "BufNewFile"},
        version = false,
        config = function() 
            require('mini.splitjoin').setup() 
        end,
    },
    {
        'echasnovski/mini.surround',
        event = {"BufReadPre", "BufNewFile"},
        version = false,
        config = function() 
            require('mini.surround').setup() 
        end,
    },
    -- we use cmp plugin only when in insert mode
    -- so lets lazyload it at InsertEnter event, to know all the events check h-events
    -- completion , now all of these plugins are dependent on cmp, we load them after cmp
    -- {
    --     "hrsh7th/nvim-cmp",
    --     event = "InsertEnter",
    --     dependencies = {
    --         -- cmp sources
    --         "hrsh7th/cmp-buffer",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-nvim-lsp",
    --         "saadparwaiz1/cmp_luasnip",
    --         "hrsh7th/cmp-nvim-lua",
    --
    --         -- snippets
    --         --list of default snippets
    --         "rafamadriz/friendly-snippets",
    --
    --         -- snippets engine
    --         {
    --             "L3MON4D3/LuaSnip",
    --             config = function()
    --                 require("luasnip.loaders.from_vscode").lazy_load()
    --             end,
    --         },
    --
    --         -- autopairs , autocompletes ()[] etc
    --         {
    --             "windwp/nvim-autopairs",
    --             config = function()
    --                 require("nvim-autopairs").setup()
    --
    --                 --  cmp integration
    --                 local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --                 local cmp = require("cmp")
    --                 cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --             end,
    --         },
    --     },
    --     config = function()
    --         require("plugins.configs.cmp")
    --     end,
    -- },

    {
        'neoclide/coc.nvim',
        event = "InsertEnter",
        branch = 'release',
        config = function()
            require('plugins.configs.coc')
        end,
    },
    -- {
    --     'windwp/nvim-autopairs', 
    --     event = "InsertEnter",
    --     config = function()
    --         require('nvim-autopairs').setup()
    --     end,
    -- },

    -- {
    --     "williamboman/mason.nvim",
    --     build = ":MasonUpdate",
    --     cmd = { "Mason", "MasonInstall" },
    --     config = function()
    --         -- require("plugins.configs.mason")
    --         require("mason").setup()
    --     end,
    -- },

    -- lsp
    -- {
    --     "neovim/nvim-lspconfig",
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --         require("plugins.configs.lspconfig")
    --     end,
    --     dependencies = {
    --         -- formatting , linting
    --         {
    --             'williamboman/mason.nvim',
    --             'williamboman/mason-lspconfig.nvim',
    --             'b0o/schemastore.nvim',
    --             'folke/lsp-colors.nvim',
    --             'jose-elias-alvarez/null-ls.nvim',
    --             'jayp0521/mason-null-ls.nvim',
    --             "jose-elias-alvarez/null-ls.nvim",
    --             config = function()
    --                 require("plugins.configs.null")
    --             end,
    --         },
    --     },
    -- },
    --
    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("indent_blankline").setup()
        end,
    },

    -- files finder etc
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("plugins.configs.telescope")
        end,
    },

    -- git status on signcolumn etc
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
            require("scrollbar.handlers.gitsigns").setup()
        end,
    },

    -- comment plugin
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    -- Add, change, and delete surrouding text
    -- {
    --     "tpope/vim-surround",
    --     event = { "BufReadPre", "BufNewFile" },
    --     -- lazy = false,
    -- },

    -- Adds [b and other handy mappings
    -- "tpope/vim-unimpaired",

    -- Jump to the last location when opening a file
    {
        "farmergreg/vim-lastplace",
        event = {"BufReadPre", "BufNewFile"},
    },

    -- Allow plugins to enable repeating of commands
    {
        "tpope/vim-repeat",
        event = {"BufNewFile", "BufReadPre"},
    },

    -- Indent autodetection with editorconfig support
    {
        "tpope/vim-sleuth",
        event = {"BufNewFile", "BufReadPre"},
    },

    -- Add more language support
    {
        'jwalton512/vim-blade',
        ft = "blade",
    },

    -- Enale * searching with visually selected text
    {
        "nelstrom/vim-visual-star-search",
        event = {"BufNewFile", "BufReadPre"},
    },

    -- Automatically fix indentation when pasting code
    {
        "sickill/vim-pasta",
        config = function()
            vim.g.pasta_disable_filetypes = { "fugitive" }
        end,
    },

    -- Terminal toggle
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
        cmd = "ToggleTerm",
    },

    -- LazyGit integration
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Which key for the noobs
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    -- Glow for md files
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
    },

    -- Color picker
    {
        'NvChad/nvim-colorizer.lua',
        event = {"BufNewFile", "BufReadPre"},
        config = function()
            require("colorizer").setup()
        end,
    },

    -- Smooth scrolling
    {
        "karb94/neoscroll.nvim",
        event = {"BufNewFile", "BufReadPre"},
        config = function()
            require("neoscroll").setup()
        end,
    },

    -- Add a scrollbar
    {
        "petertriho/nvim-scrollbar",
        event = {"BufNewFile", "BufReadPre"},
        config = function()
            require("plugins.configs.scrollbar")
        end,
    },

    {
        "kevinhwang91/nvim-hlslens",
        event = {"BufNewFile", "BufReadPre"},
        config = function()
            -- require('hlslens').setup() is not required
            require("scrollbar.handlers.search").setup({
                -- hlslens config overrides
            })
        end,
    },

    -- Add Zenmode
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
    },

    -- TODO: comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = {"BufNewFile", "BufReadPre"},
        config = function()
            require("todo-comments").setup()
        end,
    },
    -- {
    --     'phpactor/phpactor',
    --     ft = 'php, blade',
    --     build = 'composer install --no-dev --optimize-autoloader',
    --     config = function()
    --         vim.keymap.set('n', '<leader>pm', ':PhpactorContextMenu<CR>')
    --         vim.keymap.set('n', '<leader>pn', ':PhpactorClassNew<CR>')
    --     end,
    -- },
    -- {
    --     "github/copilot.vim", 
    --     event = {"BufNewFile", "BufReadPre"},
    -- },
    {
        'kevinhwang91/nvim-ufo',
        event = 'VeryLazy',
        dependencies = 'kevinhwang91/promise-async',
       config = function()
            -- require("ufo").setup({
            --     provider_selector = function(bufnr, filetype, buftype)
            --         return ''
            --     end})
            require("plugins.configs.ufo")
        end,
    },
    {
        "nvim-neorg/neorg",
        -- build = ":Neorg sync-parsers",
        build = ":au BufReadPre,BufNewFile *.norg setfiletype norg", -- This is the important bit!
        -- event = "VeryLazy",
        cmd = "Neorg",
        ft = "norg",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.configs.neorg")
        end,
    },
    {
        "aserowy/tmux.nvim",
        event = "VeryLazy",
        config = function() return require("tmux").setup() end,
    },
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    {
        'chrisbra/csv.vim',
        ft= 'csv',
    },
    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     event = "VeryLazy",
    --     opts = {}
    -- },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
            -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
}

require("lazy").setup(plugins, require("plugins.configs.lazy"))
