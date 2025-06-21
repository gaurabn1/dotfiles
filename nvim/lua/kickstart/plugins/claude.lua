return {
  {
    'pasky/claude.vim',
    lazy = false,
    config = function()
      local api_key = "" //enter your api key form claude
      if api_key then
        vim.g.claude_api_key = api_key
      else
        vim.notify('ANTHROPIC_API_KEY environment variable is not set', vim.log.levels.WARN)
      end

      -- Add keymaps (the default conflict with NVChad. Skip if you want)
      vim.keymap.set('v', '<leader>Ci', ":'<,'>ClaudeImplement ", { noremap = true, desc = 'Claude Implement' })
      vim.keymap.set('n', '<leader>Cc', ':ClaudeChat<CR>', { noremap = true, silent = true, desc = 'Claude Chat' })
    end,
  },
}
