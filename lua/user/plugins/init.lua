-- Function to import files that return plugin specs in table format for lazy.nvim to manage
-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec
require "user.plugins.spec"

spec "user.plugins.treesitter"
spec "user.plugins.gitsigns"
spec "user.plugins.lspconfig"
spec "user.plugins.mason"
spec "user.plugins.none-ls"
spec "user.plugins.project"
spec "user.plugins.telescope"
spec "user.plugins.cmp"
spec "user.plugins.indentlines"
spec "user.plugins.firenvim"
spec "user.plugins.ufo"
spec "user.plugins.comment"

require "user.plugins.lazy"
