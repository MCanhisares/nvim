-- This file can be loaded by calling `lua require('plugins')` from your init.vim

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

local packer_bootstrap = ensure_packer()
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use({
    'folke/tokyonight.nvim',
    as = 'tokyo-night',
    config = function()
      vim.cmd('colorscheme tokyonight-night')
    end
  })
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('ThePrimeagen/harpoon')
  use('tpope/vim-fugitive')
  use("nvim-treesitter/nvim-treesitter-context");
  use('mfussenegger/nvim-lint')
  use({
    "okuuva/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        vim.loader.enable()
      }
    end,
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
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

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use({
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  })
  use({
    'm4xshen/autoclose.nvim',
    config = function()
      require("autoclose").setup {
      }
    end,
  })
  use 'puremourning/vimspector'
  use({
    'folke/trouble.nvim',
    tag = 'v2.8.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local trouble = require('trouble')
      trouble.setup {
        position = "right"
      }
      vim.keymap.set("n", "<leader>xx", ":TroubleToggle <CR>")
      vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
      vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
      vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
      vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
      vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
    end
  })
  use 'voldikss/vim-floaterm'
  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
          vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
        end
      })
    end
  }
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'RRethy/vim-illuminate'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use "tpope/vim-surround"
  if packer_bootstrap then
    require('packer').sync()
  end
end)
