local fn = vim.fn
local gkey = vim.api.nvim_set_var


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  -- standard stuff dunno
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- idk but i guess
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "altercation/vim-colors-solarized" --solarized color scheme
  -- cmp & lsp
  use {
      "williamboman/nvim-lsp-installer",
      {
          "neovim/nvim-lspconfig",
          config = function()
              require("nvim-lsp-installer").setup {}
              local lspconfig = require("lspconfig")
              lspconfig.sumneko_lua.setup {}
          end
      }
  }
  use "hrsh7th/cmp-nvim-lsp" -- also from nvim cmp-repo
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "f3fora/cmp-spell"
  use "hrsh7th/nvim-cmp" -- The completion plugin
  --
  -- snippets (via luasnip)
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  -- for snippets symbols
  use "onsails/lspkind-nvim"  
  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" -- for rainbow parentheses

  --
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)



