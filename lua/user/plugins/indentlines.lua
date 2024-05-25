local M = {
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
}

function M.config()
  require("ibl").setup {
    scope = { enabled = true },
  }
end

return M
