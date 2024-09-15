vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Cursor", { reverse = false })
    vim.api.nvim_set_hl(0, "Visual", { reverse = true })

    -- Remove background
    vim.api.nvim_set_hl(0, "Normal", {})
    vim.api.nvim_set_hl(0, "NormalNC", {})
    vim.api.nvim_set_hl(0, "EndOfBuffer", {})
  end,
})
