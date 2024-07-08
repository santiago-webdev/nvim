local M = {
  'rainbowhxch/accelerated-jk.nvim',
}

function M.config()
  vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
  vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
end

return M
