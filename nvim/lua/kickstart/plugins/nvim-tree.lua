return {
  {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }, -- Optional, for file icons
    config = function()
      require('nvim-tree').setup {
        filters = {
          dotfiles = true,
        },
      }
    end,
  },
}
