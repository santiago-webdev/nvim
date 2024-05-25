require 'user.settings'

-- Function to import files that return plugin specs in table format for lazy.nvim to manage
-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec
require "user.spec"

spec "user.treesitter"
spec "user.gitsigns"
spec "user.lspconfig"
spec "user.mason"
spec "user.none-ls"
spec "user.project"
spec "user.telescope"
spec "user.cmp"
spec "user.indentlines"
spec "user.firenvim"
spec "user.ufo"
spec "user.comment"

require "user.lazy"
