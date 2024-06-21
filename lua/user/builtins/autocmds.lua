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
