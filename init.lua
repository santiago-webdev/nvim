require "user"

require "user.plugins.spec"
spec "user.plugins.gitsigns"
spec "user.plugins.project"
spec "user.plugins.telescope"
spec "user.plugins.indentlines"
spec "user.plugins.firenvim"
-- LSP
spec "user.plugins.lspconfig"
spec "user.plugins.mason"
spec "user.plugins.none-ls"
-- Plugins that do it better than builtins
spec "user.plugins.treesitter" -- Syntax
spec "user.plugins.cmp" -- Completion
spec "user.plugins.comment" -- Comments
spec "user.plugins.ufo" -- Folds

require "user.plugins.lazy" -- Plugin installer
