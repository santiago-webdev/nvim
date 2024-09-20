vim.filetype.add({
  extension = {
    mdx = "markdown",
  },
  filename = {
    [".npmignore"] = "ignore",
    ["tsconfig.tsbuildinfo"] = "json",
    ["Brewfile"] = "ruby",
    [".editorconfig"] = "ini",
    [".eslintrc.json"] = "jsonc",
    [".justfile"] = "make",
    ["Justfile"] = "make",
  },
  pattern = {
    ["tsconfig*.json"] = "jsonc",
    [".*/%.vscode/.*%.json"] = "jsonc",
  },
})
