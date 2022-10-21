local status, packer = pcall(require, 'packer')

if(not status) then
  print("Packer is not installed")
  return
end

packer.startup(function(use)

  --Packer
  use 'wbthomason/packer.nvim'

  --Solarized theme
  use{
    'svrana/neosolarized.nvim',
    requires = {'tjdevries/colorbuddy.nvim'}
  }

  -- LUA LINE
  use{
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
 -- use 'williamboman/mason.nvim'

  --AUTO-COMPLETION
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp

  -- TREE-SITTER
  use{ 'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }

  --AUTOPAIR and AUTOTAG
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- TELESCOPE 
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "nvim-telescope/telescope-file-browser.nvim"

  -- BUFFERLINE
  use {
    'akinsho/bufferline.nvim', tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- LSP SAGA
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
  })
end)
