local M = {
  "nvim-telescope/telescope.nvim",
  cmd = {
    "Telescope",
  },
  keys = {
    "<Leader>tf",
    "<Leader>tb",
    "<Leader><C-p>",
  },
}

function M.config()
  -- require("telescope").setup()

  vim.keymap.set("n", "<Leader>tf", function()
    require("telescope.builtin").find_files()
  end)

  vim.keymap.set("n", "<Leader>tb", function()
    require("telescope.builtin").buffers()
  end)

  vim.keymap.set("n", "<Leader><C-p>", function()
    require("telescope").extensions.projects.projects()
  end)
end

return M
