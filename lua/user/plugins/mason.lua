local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("mason").setup({ ui = { border = "rounded" } })
  require("mason-lspconfig").setup({ ensure_installed = require("user.lsp").server_list })
end

return M
