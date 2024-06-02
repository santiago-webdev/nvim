vim.filetype.add({
  extension = {
    mdx = 'markdown'
  }
})
vim.filetype.add({
  filename = {
    [".npmignore"] = 'ignore',
    ["tsconfig.tsbuildinfo"] = 'json',
    ["Brewfile"] = 'ruby'
  }
})
