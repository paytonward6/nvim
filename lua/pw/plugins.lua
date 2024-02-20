local enable_optional = false

local plugins = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim", -- popup windows
    "farmergreg/vim-lastplace",
    "kyazdani42/nvim-web-devicons",
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = {'nvim-lua/plenary.nvim'},
    },

    "guns/vim-sexp",
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
        }
    },
    --'Olical/conjure',
    'tpope/vim-fugitive',

    {
        'stevearc/oil.nvim', config = function()
            require("oil").setup()
        end
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = {'nvim-lua/plenary.nvim'}
    },

    "nvim-telescope/telescope-file-browser.nvim",

    -- LSP and Completion
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    'hrsh7th/nvim-cmp',
    "mfussenegger/nvim-dap",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'rcarriga/nvim-dap-ui',

    -- Themes
    "sainnhe/sonokai",
    "Th3Whit3Wolf/space-nvim",
    'RRethy/nvim-base16',
    {
        "catppuccin/nvim", as = "catppuccin"
    },
    -- Status Bar
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    "p00f/nvim-ts-rainbow", -- rainbow parentheses, brackets, braces
    "L3MON4D3/LuaSnip",
    "folke/which-key.nvim",
    {
        "ray-x/go.nvim", config = function()
            require("go").setup()
        end
    },
    {
        "windwp/nvim-autopairs", -- auto close sybmols
        config = function()
            require("nvim-autopairs").setup({
                --map_cr = tvve, -- send closing symbol to its own line
            })
        end,
    },

    'folke/tokyonight.nvim',
    "zah/nim.vim",-- syntax highlighting for nim
    {
      'romgrk/barbar.nvim',
      dependencies = {'kyazdani42/nvim-web-devicons'}
    },

    -- 0.5 features (lsp + treesitter)
    {
        "nvim-treesitter/nvim-treesitter", -- treesitter
        run = ":TSUpdate",
    },

    'lukas-reineke/indent-blankline.nvim',
    'jpalardy/vim-slime',
}

local mac_plugins = {
    'jbyuki/venn.nvim', -- for drawing UTF-8 diagrams in nvim
    'ThePrimeagen/vim-be-good', -- for nvim practice
    -- Table Mode
    "dhruvasagar/vim-table-mode",
    'echasnovski/mini.nvim',
    'jbyuki/nabla.nvim',
    'kaarmu/typst.vim',
    'nvim-orgmode/orgmode',
    { dir = "~/Code/Lua/nvim-wezlime" },  -- local wezlime
    { dir = "~/Code/Lua/base64.nvim/" },  -- local base64
}

local linux_plugin = {
    "paytonward6/nvim-wezlime",
    "paytonward6/base64.nvim",
}

if vim.fn.has("mac") == 1 or enable_optional then
    plugins = vim.list_extend(plugins, mac_plugins)
else
    plugins = vim.list_extend(plugins, linux_plugin)
end

return plugins
