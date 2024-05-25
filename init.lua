-- Settings {{{
vim.loader.enable()
vim.fn.matchadd("ErrorMsg", "\\s\\+$") -- Use 'ErrorMsg' highlight group for whitespace in file
vim.g.vimsyn_embed = "alpPrj"

vim.opt.clipboard = "unnamedplus" -- Share the clipboard with your DE/OS
vim.opt.confirm = true -- Instead of failing to exit because there's unsaved changes, it will ask for confirmation
vim.opt.ignorecase = true -- Makes search feel more intuitive
vim.opt.smartcase = true -- Ignorecase has to be true or this doesn't have any effect
vim.opt.autowrite = true
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.timeoutlen = 300
vim.opt.fillchars:append { eob = "␗" }
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.showbreak = '↪ ' -- Symbol prepended to wrapped lines
vim.opt.cpoptions = vim.o.cpoptions .. 'n' -- Include showbreak inside gutter
vim.opt.virtualedit = 'all'

-- Which motions are allowed to move to next/previous lines when they reach the end/start of a line
vim.opt.whichwrap = 'h,l,b,s,<,>,[,]'

-- Keep the cursor centered
vim.opt.scrolloff = 9999
vim.opt.sidescrolloff = 9999

-- Only highlight the number on the gutter to find the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Remove background from the default colorscheme
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

-- This is embarrasing
-- https://github.com/neovim/neovim/issues/20221
-- And here the solution
-- https://github.com/neovim/neovim/issues/18965
vim.opt.laststatus = 0 -- When and how is the statusline going to be shown
vim.opt.cmdheight = 0 -- hide command line
vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })
vim.opt.statusline = "%{repeat('─',winwidth('.'))}" -- How do you do this in lua?
local cancel_statusline = string.rep("─", vim.api.nvim_win_get_width(0))
vim.opt.statusline = cancel_statusline

-- Gutter numbers at the start of neovim
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd({
  "InsertEnter",
  "InsertLeave",
}, {
  desc = "Dynamically adapt the gutter style based on mode",
  callback = function()
    if vim.o.relativenumber then
      vim.o.relativenumber = false
      return
    end
    vim.opt.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  command = "lua vim.highlight.on_yank()",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  once = true,
  command = "lua vim.fn.mkdir(vim.fn.expand('%:p:h'), 'p')",
})

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
spec "user.ufo"
spec "user.comment"

require "user.lazy"
-- }}}

-- vim:fdm=marker
