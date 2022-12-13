local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)

    use 'wbthomason/packer.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        }
    }
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use { 'junegunn/fzf.vim' }
    use 'Mathijs-Bakker/zoom-vim'
    use 'vimwiki/vimwiki'
    use 'tpope/vim-surround'
    use 'dhruvasagar/vim-table-mode'
    use 'mattn/calendar-vim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'skywind3000/asyncrun.vim'
    use 'ptzz/lf.vim'
    use 'voldikss/vim-floaterm'
    use 'xiyaowong/nvim-transparent'
    use 'wellle/targets.vim'
    use 'folke/tokyonight.nvim'
    use 'preservim/nerdtree'

    -- lsp
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
        -- java
        'mfussenegger/nvim-jdtls'
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "quangnguyen30192/cmp-nvim-ultisnips",
        config = function()
          -- optional call to setup (see customization section)
          require("cmp_nvim_ultisnips").setup{}
        end,
        -- If you want to enable filetype detection based on treesitter:
        -- requires = { "nvim-treesitter/nvim-treesitter" },
      },
      config = function()
        local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
        require("cmp").setup({
          snippet = {
            expand = function(args)
              vim.fn["UltiSnips#Anon"](args.body)
            end,
          },
          sources = {
            { name = "ultisnips" },
            -- more sources
          },
          -- recommended configuration for <Tab> people:
          mapping = {
            ["<Tab>"] = cmp.mapping(
              function(fallback)
                cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
              end,
              { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
            ),
            ["<S-Tab>"] = cmp.mapping(
              function(fallback)
                cmp_ultisnips_mappings.jump_backwards(fallback)
              end,
              { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
            ),
          },
        })
      end,
    }

-- cmp
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"

	use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip" --snippet engine
    use "onsails/lspkind.nvim"
    use "ray-x/lsp_signature.nvim"
    
    -- snippets
    use "SirVer/ultisnips"
    use "honza/vim-snippets"


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

