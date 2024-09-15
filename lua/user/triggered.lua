local dynamic_gutter_numbers = vim.api.nvim_create_augroup("DynamicGutterNumbers", {
  clear = false,
})

vim.opt.number = true
vim.opt.relativenumber = true
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

vim.api.nvim_create_autocmd("BufWritePre", {
  once = true,
  desc = "Create missing dirs before writing. Same as `:write ++p` or from a shell `mkdir -p`",
  callback = function()
    vim.fn.mkdir(vim.fn.expand("%:p:h"), "p")
  end,
})
