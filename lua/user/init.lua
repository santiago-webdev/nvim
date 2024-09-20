vim.loader.enable()

require("user.set")
require("user.keymaps")
require("user.colors")
require("user.triggered")
require("user.notify-send")

vim.g.var = "alpPrj"
vim.g.mapleader = ";"
vim.g.localmapleader = vim.g.mapleader

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

vim.opt.ruler = false
vim.opt.showcmd = false

vim.opt.title = true
vim.opt.titlestring = ""
