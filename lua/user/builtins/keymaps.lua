vim.g.mapleader = ";"
vim.g.localmapleader = ";"

-- Disable unused keys for normal mode
vim
  .iter({
    "<Space>",
    "<Down>",
    "<Up>",
    "<Left>",
    "<Right>",
    "<Backspace",
    "<Enter>",
  })
  :map(function(v)
    return vim.keymap.set("n", v, "<Nop>")
  end)

-- Move line blacks of any visual selection around
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Keep the visual selection after using < or > motions
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<Leader>mm", vim.cmd.marks) -- Gets superseeded by Telescope mapping
vim.keymap.set("n", "//", "/<Up>") -- UX improvement to quickly come back to the last thing you searched for
