return {
  {
    "akinsho/toggleterm.nvim",
	lazy = true,
	version = "*",
    cmd = { "ToggleTerm" },
	keys = { { "<leader>tt", ":ToggleTerm size=30 close_on_exit=true direction=float name=home<cr>", desc = "Toggle Terminal floating window" } },
	config = true,
  },
}
