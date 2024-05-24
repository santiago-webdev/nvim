vim.loader.enable()

-- Settings {{{
vim.opt.clipboard = "unnamedplus" -- Share the clipboard with your DE/OS
vim.opt.confirm = true -- Instead of failing to exit because there's unsaved changes, it will ask for confirmation
vim.opt.ignorecase = true -- Makes search feel more intuitive
vim.opt.smartcase = true -- Ignorecase has to be true or this doesn't have any effect
vim.opt.scrolloff = 9999 -- Keep the cursor centered
vim.opt.autowrite = true
vim.fn.matchadd("ErrorMsg", "\\s\\+$") -- Use 'ErrorMsg' highlight group for whitespace in file
vim.g.have_nerd_font = true
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Remove background from colorscheme
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

-- Hide status and command line
vim.opt.laststatus = 0
vim.opt.cmdheight = 0

-- This is embarrasing
-- https://github.com/neovim/neovim/issues/20221
-- And here the solution
-- https://github.com/neovim/neovim/issues/18965
vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })
vim.opt.statusline = "%{repeat('─',winwidth('.'))}" -- How do you do this in lua?
local cancel_statusline = string.rep("-", vim.api.nvim_win_get_width(0))
vim.opt.statusline = cancel_statusline

-- Gutter numbers, dynamically change based on mode
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd({
  "InsertEnter",
}, {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({
  "InsertLeave",
}, {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "lua vim.highlight.on_yank()",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  once = true,
  command = "lua vim.fn.mkdir(vim.fn.expand('%:p:h'), 'p')",
})
-- }}}
-- Keymaps {{{
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- }}}
-- Plugins {{{
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

require "user.lazy"
-- }}}

-- vim:fdm=marker
