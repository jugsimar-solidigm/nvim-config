-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
    	vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        	{ out, "WarningMsg" },
        	{ "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
	-- highlight-start
	spec = {
		-- add your plugins here
      	{ 
			"catppuccin/nvim", 
			name = "catppuccin",
			priority = 1000 
		},
		{ 
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" }
		},
		{ 
			"nvim-tree/nvim-tree.lua", 
			version = "*", 
			requires = { "nvim-tree/nvim-web-devicons", },
			config = function ()
				require("nvim-tree").setup {}
				end,
		},
		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("lazy").setup({{
					"nvim-treesitter/nvim-treesitter",
					build = ":TSUpdate",
					config = function () 
					  local configs = require("nvim-treesitter.configs")

					  configs.setup({
						  ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
						  
						  -- install parsers synchronously (only applied to 'ensure_installed')
						  sync_install = false,

						  -- automatically install missing parsers when entering buffer
						  -- recomendation: set to false if you dont have tree-sitter CLI installed
						  auto_install = true,

						  -- if you need to change the installation directory of the parsers
						  -- parser_install_dir = "some/path/to/store/parsers"
						  
						  -- enable highlighting 
						  highlight = { 
								enable = true,
							
								-- list of parsers (not the filetype) to disable highlighting
								disable = {},
						  },


						  -- list of parsers to ignore installing (or "all")
						  ignore_install = {},

						  indent = { enable = true },  
						})
					end
				 }})
			end
		},
	},
	-- highlight-end
  	-- Configure any other settings here. See the documentation for more details.
 	-- colorscheme that will be used when installing plugins.
	install = {},
  	-- automatically check for plugin updates
  	checker = { enabled = true },
})
