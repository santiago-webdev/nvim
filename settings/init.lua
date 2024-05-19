vim.opt.number = true -- Line numbers
vim.opt.clipboard = "unnamedplus" -- Share the clipboard with your DE/OS
vim.opt.confirm = true -- Instead of failing to exit because there's unsaved changes, it will ask for confirmation
vim.opt.expandtab = true -- For insert mode, pressing TAB will insert spaces instead
vim.opt.ignorecase = true -- Makes search feel more intuitive
vim.opt.smartcase = true -- Ignorecase has to be true or this doesn't have any effect

vim.opt.cursorline = true -- The lines that help you locate the cursor
vim.opt.cursorcolumn = true

require "settings.keymaps"
