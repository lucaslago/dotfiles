local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- File explorer
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'
  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make' }
    }
  }
  -- Theme
  use { "ellisonleao/gruvbox.nvim" }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- Icons
  -- use('kyazdani42/nvim-web-devicons')
  -- Highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  -- AST debugger
  use('nvim-treesitter/playground')
  -- File navigation "favorites"
  use('ThePrimeagen/harpoon')
  -- Undo history
  use('mbbill/undotree')
  -- Git support
  use('tpope/vim-fugitive')
  -- LSP
  use { 'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Help signatures for function parameters in insert
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Language agnostic comments
  use('tpope/vim-commentary')

  -- Auto insertion of closing tags
  use('Raimondi/delimitMate')

  -- Keybinding previews on popup
  use('folke/which-key.nvim')

  -- Debugger client
  use 'mfussenegger/nvim-dap'

  -- Pomodoro
  use {
    'wthollingsworth/pomodoro.nvim',
    requires = 'MunifTanjim/nui.nvim'
  }

  use {
    'github/copilot.vim'
  }

  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }

  -- yarn pnp support https://yarnpkg.com/getting-started/editor-sdks
  use('lbrayner/vim-rzip')
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  -- Formatter
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })
  if packer_bootstrap then
    require('packer').sync()
  end
end)
