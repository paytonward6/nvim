return {
  'tpope/vim-fugitive',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>gh', ':vertical Git<CR>', { desc = '[G]it open' })
    vim.api.nvim_set_keymap('n', '<leader>gg', ':Git ', { desc = '[G]it commandline' })
  end,
}
