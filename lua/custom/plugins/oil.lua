return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      float = {
        max_height = 30,
      },
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
  end,
}
