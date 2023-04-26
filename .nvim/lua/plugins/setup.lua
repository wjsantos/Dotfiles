-- Packer, manually install it:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--   ~/.config/nvim/pack/packer/start/packer.nvim
-- OR auto install packer if not installed
-- $PWD/.local/share/nvim/ + ..
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

return require("packer").startup(function()
  use "wbthomason/packer.nvim"          -- https://github.com/wbthomason/packer.nvim

  -- Look and Feel
  use "rebelot/kanagawa.nvim"
  vim.cmd("colorscheme kanagawa")

  -- Productivity
  use "jlanzarotta/bufexplorer" -- https://github.com/jlanzarotta/bufexplorer
  use "preservim/nerdtree"

  use "nvim-lualine/lualine.nvim"       -- https://github.com/nvim-lualine/lualine.nvim
  -- use {
  --   "nvim-tree/nvim-tree.lua",          -- https://github.com/nvim-tree/nvim-tree.lua
  --   requires = {
  --     "nvim-tree/nvim-web-devicons",    -- https://github.com/nvim-tree/nvim-web-devicons
  --   },
  -- }
  use {
    "nvim-telescope/telescope-fzf-native.nvim", -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    run = "make",
  }
  use {
    "nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
    requires = {
      "nvim-lua/plenary.nvim",
    },
    branch = "0.1.x",
  }

  -- Development
  use "lewis6991/gitsigns.nvim"             -- https://github.com/lewis6991/gitsigns.nvim
  use {
    "nvim-treesitter/nvim-treesitter",      -- https://github.com/nvim-treesitter/nvim-treesitter
    run = ":TSUpdate"
  }

  -- Plantuml
  use "aklt/plantuml-syntax"
  use "tyru/open-browser.vim"
  use "weirongxu/plantuml-previewer.vim"

  -- DAP
  use "mfussenegger/nvim-dap"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects" -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  use "rhysd/vim-clang-format"              -- https://github.com/rhysd/vim-clang-format

  use "SirVer/ultisnips"                    -- https://github.com/sirver/UltiSnips
  use "honza/vim-snippets"                  -- https://github.com/honza/vim-snippets/blob/master/snippets/go.snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"                -- https://github.com/hrsh7th/cmp-nvim-lsp
  use "hrsh7th/nvim-cmp"                    -- https://github.com/hrsh7th/nvim-cmp
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use "neovim/nvim-lspconfig"               -- https://github.com/neovim/nvim-lspconfig
  use "onsails/lspkind-nvim"                -- https://github.com/onsails/lspkind-nvim
  use "quangnguyen30192/cmp-nvim-ultisnips" -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
  use "williamboman/nvim-lsp-installer"     -- https://github.com/williamboman/nvim-lsp-installer
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use "numToStr/Comment.nvim"               -- https://github.com/numToStr/Comment.nvim
  use "kburdett/vim-nuuid"                  -- https://github.com/kburdett/vim-nuuid

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- golang
  use({
    'ray-x/go.nvim',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    },
  })

  -- typescript
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
