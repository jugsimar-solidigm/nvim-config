return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.8",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for install instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
  },

  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set(
      "n",
      "<leader>fz",
      ":Telescope find_files hidden=true no_ignore=true<CR>",
      { desc = "Telescope find files" }
    )
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope grep current word" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fs", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope search recent files" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope list of normal mode keymap" })
    vim.keymap.set(
      "n",
      "<leader>fc",
      builtin.keymaps,
      { desc = "Telescope Lists available plugin/user commands and runs them on <cr>" }
    )

    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.load_extension("live_grep_args")

    telescope.setup({
      extension = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      live_grep_args = {
        auto_quoting = true,

        -- define mappings
        mappings = {
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
          },
        },
      },
    })

    local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
    vim.keymap.set("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)
  end,
}
