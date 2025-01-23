return {
  {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }, -- Optional, for file icons
    config = function()
      require('nvim-tree').setup {
        -- Add any custom settings here (if needed)
      }
    end,
  },
}
