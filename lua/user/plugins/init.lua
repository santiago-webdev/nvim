require("user.plugins.spec")

spec("user.plugins.gitsigns")
spec("user.plugins.project")
spec("user.plugins.telescope")
spec("user.plugins.indentlines")
spec("user.plugins.firenvim")
spec("user.plugins.accelerated-jk")
spec("user.plugins.nvim-colorizer")

--- LSP Setup
spec("user.plugins.lsp-setup.lspconfig")
spec("user.plugins.lsp-setup.mason")
spec("user.plugins.lsp-setup.none-ls")
spec("user.plugins.lsp-setup.nvim-jdtls")

--- Plugins that replace builtin tooling
spec("user.plugins.treesitter")
spec("user.plugins.cmp")
spec("user.plugins.comment")
spec("user.plugins.ufo")

require("user.plugins.lazy")
