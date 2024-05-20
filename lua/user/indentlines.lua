local M = {
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
}

function M.config()
  require("ibl").setup()
end

return M
