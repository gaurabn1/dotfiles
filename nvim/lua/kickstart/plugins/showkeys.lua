return {
  {
    'nvzone/showkeys',
    event = 'VimEnter',
    opts = {
      position = 'top-right', -- Position where the keys will appear
      maxkeys = 3, -- Max number of keys to display
      show_count = false, -- Show the count of keys
    },
    config = function(_, opts)
      require('showkeys').setup(opts) -- Applying the configuration using setup
      vim.cmd 'ShowkeysToggle' -- Trigger the showkeys display
    end,
  },
}
