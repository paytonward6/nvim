local enable_optional = false

local plugins = {
    "wbthomason/packer.nvim",
    "nvim-lua/popup.nvim", -- popup windows
    "farmergreg/vim-lastplace",
    "kyazdani42/nvim-web-devicons",
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    },

    "guns/vim-sexp",
    'Olical/conjure',
    'tpope/vim-fugitive',

    {
        'stevearc/oil.nvim', config = function()
            require("oil").setup()
        end
    },
    {
        "ThePrimeagen/harpoon",
        requires = {{'nvim-lua/plenary.nvim'}}
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
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    },

    "p00f/nvim-ts-rainbow", -- rainbow parentheses, brackets, braces
    "L3MON4D3/LuaSnip",
    "folke/which-key.nvim",
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
      requires = {'kyazdani42/nvim-web-devicons'}
    },

    -- 0.5 features (lsp + treesitter)
    {
        "nvim-treesitter/nvim-treesitter", -- treesitter
        run = ":TSUpdate",
    },

    'lukas-reineke/indent-blankline.nvim',
}

local optional_plugins = {
    'jbyuki/venn.nvim', -- for drawing UTF-8 diagrams in nvim
    'ThePrimeagen/vim-be-good', -- for nvim practice
    -- Table Mode
    "dhruvasagar/vim-table-mode",
    'echasnovski/mini.nvim',
    'jbyuki/nabla.nvim',
    'kaarmu/typst.vim',
    'nvim-orgmode/orgmode',
}

if vim.fn.has("mac") or enable_optional then
    plugins = vim.list_extend(plugins, optional_plugins)
end


-- Bootstrap packer if necessary
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false
--local lsp_filetypes = require('ag.lsp_config')

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Init setup
vim.cmd("packadd packer.nvim") -- load packer
local packer = require("packer")

packer.init({
    auto_reload_compiled = true,
})

packer.startup(function(use)
    for _, plugin in pairs(plugins) do
        use(plugin)
    end

    -- Grab all packages if we're setting up for the first time
    if packer_bootstrap then packer.sync() end
end)
-- NOTE: If :h <plugin> does not work, run :helptags ALL to add them

return packer_bootstrap
