require("user.plugins.spec")

spec("user.plugins.colorscheme")
spec("user.plugins.gitsigns")
spec("user.plugins.project")
spec("user.plugins.telescope")
spec("user.plugins.indentlines")
spec("user.plugins.firenvim")
spec("user.plugins.accelerated-jk")
spec("user.plugins.nvim-colorizer")
spec("user.plugins.autopairs")

--- LSP
spec("user.plugins.mason")
spec("user.plugins.schemastore")
spec("user.plugins.lspconfig")
spec("user.plugins.none-ls")

--- Plugins that replace builtin tooling
spec("user.plugins.treesitter")
spec("user.plugins.comment")
spec("user.plugins.ufo")
spec("user.plugins.cmp")

require("user.plugins.lazy")
