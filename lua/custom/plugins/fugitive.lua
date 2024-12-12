return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gh', ':vertical Git<CR>', { desc = '[G]it open' })
    vim.keymap.set('n', '<leader>gg', ':Git ', { desc = '[G]it commandline' })
  end,
}
