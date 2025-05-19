vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true -- enable line numbers
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.termguicolors = true -- required by bufferline, as it reads the hex gui color values of various highlight groups
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- set clipboard to unnamedplus, in windows unnamed and unnamedplus is the same
-- in linux, unnamedplus points to the system clipboard which allows yanking and
-- pasting from other programs
vim.opt.clipboard = "unnamedplus"

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
