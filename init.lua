require("user")
require("user.plugins.spec")

spec("user.plugins.gitsigns")
spec("user.plugins.project")
spec("user.plugins.telescope")
spec("user.plugins.indentlines")
spec("user.plugins.firenvim")
spec("user.plugins.lspconfig")
spec("user.plugins.mason")
spec("user.plugins.none-ls")
spec("user.plugins.nvim-jdtls")
spec("user.plugins.accelerated-jk")
spec("user.plugins.nvim-colorizer")

-- Plugins that replace builtin tooling
spec("user.plugins.treesitter")
spec("user.plugins.cmp")
spec("user.plugins.comment")
spec("user.plugins.ufo")

require("user.plugins.lazy")
