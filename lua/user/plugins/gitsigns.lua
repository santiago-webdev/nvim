local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}

M.config = function()
  require("gitsigns").setup({
    signcolumn = false,
    numhl = true,
    preview_config = {
      border = "rounded",
    },
  })
end

return M
