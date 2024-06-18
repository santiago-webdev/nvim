vim.loader.enable()

require "user.builtins.keymaps"
require "user.builtins.colorscheme"

vim.g.var = "alpPrj"

vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.smartcase = true
vim.opt.autowrite = true
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.timeoutlen = 300
vim.opt.fillchars:append { eob = '␗'}
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars:append { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.showbreak = "↪ "
vim.opt.cpoptions:append "n"
vim.opt.virtualedit = "all"
vim.opt.whichwrap:append "h,l,<,>,~,[,]"
vim.opt.scrolloff = 9999
vim.opt.sidescrolloff = 999
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = true
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = false

-- This is embarrasing
-- https://github.com/neovim/neovim/issues/20221
-- And here the solution
-- https://github.com/neovim/neovim/issues/18965
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.statusline = "%#Comment#" .. string.rep("─", vim.api.nvim_win_get_width(0)) .. "%*"

-- Dynamic gutter numbers, they change based on mode
vim.opt.number = true
vim.opt.relativenumber = true

local dynamic_gutter_numbers = vim.api.nvim_create_augroup("DynamicGutterNumbers", { clear = false })

vim.api.nvim_create_autocmd("InsertLeave", {
  desc = "Dynamic gutter numbers, they change based on mode",
  group = dynamic_gutter_numbers,
  callback = function()
    vim.opt.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  desc = "Dynamic gutter numbers, they change based on mode",
  group = dynamic_gutter_numbers,
  callback = function()
    vim.opt.relativenumber = false
  end,
})

-- Visual feedback when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Visual feedback when yanking text",
  group = vim.api.nvim_create_augroup("YankFeedback", { clear = false }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remember cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Remember cursor position",
  group = vim.api.nvim_create_augroup("RememberCursorPosition", { clear = false }),
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
})
