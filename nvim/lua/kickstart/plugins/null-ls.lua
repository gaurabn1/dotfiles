return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Set up null-ls after installation
      local null_ls = require 'null-ls'

      null_ls.setup {
        sources = {
          -- Add sources here, for example:
          null_ls.builtins.formatting.prettier, -- Prettier for formatting
          null_ls.builtins.diagnostics.eslint, -- ESLint for diagnostics
          null_ls.builtins.formatting.black, -- Black for Python formatting
          -- Add more tools as needed
        },
      }
    end,
  },
}
