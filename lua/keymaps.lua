--[[
	@file keymaps.lua
	@brief Neovim system wide keymaps. All keymaps here should not depend
 		   on any plugins.
--]]

-- set spacebar as leader key
vim.g.mapleader = " "

-- buffers walkthrough
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- Terminal open bindings
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		-- disable number at terminal ... not to make it awkward
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- Create a "<space>st" command that starts the terminal in a new window below
vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)
