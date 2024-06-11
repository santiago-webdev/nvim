local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cmd = "Telescope",
    },
  },
}

function M.config()
  require("telescope").setup {
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

vim.keymap.set("n", "<Leader>tf", function()
  require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<c-p>", function()
  require("telescope").extensions.projects.projects()
end)

return M
