local M = {
  -- "ferdinandrau/lavish.nvim",
  "Mofiqul/adwaita.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  -- require("lavish").apply()
  -- vim.g.adwaita_darker = true -- for darker version
  -- vim.g.adwaita_disable_cursorline = false -- to disable cursorline
  vim.g.adwaita_transparent = true -- makes the background transparent
  vim.cmd.colorscheme("adwaita")
end

return M
