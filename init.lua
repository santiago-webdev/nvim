vim.loader.enable()

-- Function to import files that return plugin specs in table format for lazy.nvim to manage
-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec
require "user.spec"

spec "user.external.treesitter"
spec "user.external.gitsigns"
spec "user.external.lspconfig"
spec "user.external.mason"
spec "user.external.none-ls"
spec "user.external.project"
spec "user.external.telescope"

require "user.lazy"

local config_path = vim.fn.stdpath "config"
package.path = package.path
  .. ";"
  .. config_path
  .. "/settings/init.lua;"
  .. config_path
  .. "/settings/?.lua;"
  .. config_path
  .. "/settings/?/init.lua;"
