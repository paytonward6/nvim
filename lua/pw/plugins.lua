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
    -- Strictly required
    use("wbthomason/packer.nvim") -- let packer manage itself
    use("nvim-lua/popup.nvim") -- popup windows
    use("farmergreg/vim-lastplace")
    use("kyazdani42/nvim-web-devicons")
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {"ThePrimeagen/harpoon",
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- LSP and Completion
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'jbyuki/nabla.nvim'

    -- Themes
    use("sainnhe/sonokai")
    use("Th3Whit3Wolf/space-nvim")
    use {"catppuccin/nvim", as = "catppuccin" }
    use 'folke/tokyonight.nvim'
    use 'RRethy/nvim-base16'

    -- Status Bar
    use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })

    use("p00f/nvim-ts-rainbow") -- rainbow parentheses, brackets, braces

    --use("L3MON4D3/LuaSnip")

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

    use("folke/which-key.nvim")

    use({
        "windwp/nvim-autopairs", -- auto close sybmols
        config = function()
            require("nvim-autopairs").setup({
                --map_cr = tvve, -- send closing symbol to its own line
            })
        end,
    })

    use("zah/nim.vim") -- syntax highlighting for nim

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    use('nvim-orgmode/orgmode')

    -- Table Mode
    use("dhruvasagar/vim-table-mode")

    -- 0.5 features (lsp + treesitter)
    use({
        "nvim-treesitter/nvim-treesitter", -- treesitter
        run = ":TSUpdate",
    })

    use 'ThePrimeagen/vim-be-good' -- for nvim practice

    use 'Olical/conjure' -- interactive code evaluation (for LISPs and Python)

    use 'jbyuki/venn.nvim' -- for drawing UTF-8 diagrams in nvim

    -- Grab all packages if we're setting up for the first time
    if packer_bootstrap then packer.sync() end
end)
-- NOTE: If :h <plugin> does not work, run :helptags ALL to add them

return packer_bootstrap
