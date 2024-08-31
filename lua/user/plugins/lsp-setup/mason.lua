local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.ensure_installed = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "astro",
  "pyright",
  "bashls",
  "jsonls",
  "jdtls",
  "yamlls",
  "marksman",
  "rust_analyzer",
  "eslint",
}

function M.config()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })
  require("mason-lspconfig").setup({
    ensure_installed = M.ensure_installed,
  })
end

return M
