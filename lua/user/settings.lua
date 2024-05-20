vim.opt.clipboard = "unnamedplus" -- Share the clipboard with your DE/OS
vim.opt.confirm = true -- Instead of failing to exit because there's unsaved changes, it will ask for confirmation
vim.opt.expandtab = true -- For insert mode, pressing TAB will insert spaces instead
vim.opt.ignorecase = true -- Makes search feel more intuitive
vim.opt.smartcase = true -- Ignorecase has to be true or this doesn't have any effect

-- The lines that help you locate the cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Remove background from colorscheme
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

-- Hide status and command line
vim.opt.laststatus = 0
vim.opt.cmdheight = 0

-- Gutter numbers, dynamically change based on mode
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd({
  "CmdlineEnter",
  "InsertEnter",
}, {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({
  "CmdlineLeave",
  "InsertLeave",
}, {
  callback = function()
    vim.opt.relativenumber = true
  end,
})
