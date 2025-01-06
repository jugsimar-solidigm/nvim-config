return {
	"nvim-tree/nvim-tree.lua", 
     
	version = "*", 
     
	requires = {
		"nvim-tree/nvim-web-devicons",
	},
     
	config = function ()
	  	-- tree
		vim.keymap.set("n", "<leader>ef",  ":NvimTreeFindFile<cr>")
		vim.keymap.set("n", "<leader>et",  ":NvimTreeToggle<cr>")
		vim.keymap.set("n", "<leader>ec",  ":NvimTreeCollapse<cr>")
		require("nvim-tree").setup {}
    end,
}
