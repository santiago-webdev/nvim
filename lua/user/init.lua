vim.loader.enable()
vim.g.var = "alpPrj"
vim.g.mapleader = ";"
vim.g.localmapleader = ";"
vim.opt.confirm = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.linebreak = true
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 600
vim.opt.ttimeoutlen = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.inccommand = "split"
vim.opt.showbreak = "↪ "
vim.opt.virtualedit = "all"
vim.opt.scrolloff = 9999
vim.opt.sidescrolloff = 999
vim.opt.cursorlineopt = "number"

vim.opt.cpoptions:append({ n = true })
vim.opt.fillchars:append({ eob = "␗" })
vim.opt.listchars:append({
  tab = "» ",
  trail = "·",
  nbsp = "␣",
})
vim.opt.whichwrap:append({
  h = true,
  l = true,
  ["<"] = true,
  [">"] = true,
  ["~"] = true,
  ["["] = true,
  ["]"] = true,
})

-- This is embarrasing
-- https://github.com/neovim/neovim/issues/20221
-- And here the solution
-- https://github.com/neovim/neovim/issues/18965
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.statusline = "%#Comment#" .. string.rep("─", vim.api.nvim_win_get_width(0)) .. "%*"

vim.opt.number = true
vim.opt.relativenumber = true

local dynamic_gutter_numbers = vim.api.nvim_create_augroup("DynamicGutterNumbers", {
  clear = false,
})

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

vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.api.nvim_create_autocmd("FocusLost", {
  desc = "Write to the file when you unfocus neovim",
  group = dynamic_gutter_numbers,
  callback = function()
    vim.cmd("write")
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Visual feedback when yanking text",
  group = vim.api.nvim_create_augroup("YankFeedback", { clear = false }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Remember cursor position",
  group = vim.api.nvim_create_augroup("RememberCursorPosition", { clear = false }),
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Before writing a file, create necessary directories if missing",
  group = vim.api.nvim_create_augroup("EnsureDirectoryStructure", { clear = false }),
  once = true,
  callback = function()
    vim.fn.mkdir(vim.fn.expand("%:p:h"), "p")
  end,
})

require("user.keys")
require("user.colors")
