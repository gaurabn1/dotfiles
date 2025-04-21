return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      direction = 'float',
    }
    vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { silent = true, desc = 'Toggle Floating Terminal' })
  end,
}
