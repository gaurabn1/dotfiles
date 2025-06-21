return {
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Dependency for Codeium
      'hrsh7th/nvim-cmp', -- Dependency for nvim-cmp (completion engine)
    },
    config = function()
      -- Ensure you set up Codeium correctly
      require('codeium').setup {
        completion_enabled = true, -- Enable code completions
        keymap = {
          accept = '<CR>', -- Accept completion with Enter key
          accept_word = '<C-t>', -- Accept word completion with Ctrl+t
          jump_next = '<C-j>', -- Jump to the next suggestion
          jump_prev = '<C-k>', -- Jump to the previous suggestion
          dismiss = '<C-d>', -- Dismiss suggestions
        },

        -- Other configuration options
        notify = function(msg, level)
          if level ~= 'error' then
            vim.notify(msg, level)
          end
        end,
      }
    end,
  },
}
