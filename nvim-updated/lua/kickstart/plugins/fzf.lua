return {
  {
    'ibhagwan/fzf-lua',
    config = function()
      -- Configure fzf-lua
      require('fzf-lua').setup {
        winopts = {
          height = 0.85,
          width = 0.80,
          row = 0.35,
          col = 0.50,
        },
      }

      -- Load fzf-lua and set keymaps
      local fzf = require 'fzf-lua'

      -- Safely set keymaps
      vim.keymap.set('n', '<leader>sf', function()
        fzf.files()
      end, { desc = 'Find files' })

      vim.keymap.set('n', '<leader>sg', function()
        fzf.live_grep()
      end, { desc = 'Live grep' })

      vim.keymap.set('n', '<leader><leader>', function()
        fzf.buffers()
      end, { desc = 'List buffers' })

      vim.keymap.set('n', '<leader>sh', function()
        fzf.help_tags()
      end, { desc = 'Help tags' })

      vim.keymap.set('n', '<leader>s.', function()
        fzf.oldfiles()
      end, { desc = '[S]earch Recent Files ("." for repeat)' })

      vim.keymap.set('n', '<leader>sn', function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      vim.keymap.set('n', '<leader>/', function()
        require('fzf-lua').live_grep_native {
          search = '',
          prompt = 'Buffer❯ ',
          cwd = vim.fn.expand '%:p:h',
          winopts = {
            preview = { hidden = false },
            -- height = 0.4,
          },
        }
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect Fzf' })

      vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    end,
  },
}
