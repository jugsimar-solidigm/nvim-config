-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fs",  ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp",  ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz",  ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo",  ":Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>fh",  builtin.help_tags, { desc = "Telescope help tags" } )

-- tree
vim.keymap.set("n", "<leader>ef",  ":NvimTreeFindFile<cr>")
vim.keymap.set("n", "<leader>et",  ":NvimTreeToggle<cr>")

