if vim.env.VIRTUAL_ENV then
  vim.g.python3_host_prog = vim.env.VIRTUAL_ENV .. '/bin/python'
end

return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      dap.set_log_level 'TRACE'
      if vim.env.VIRTUAL_ENV then
        dap.adapters.python = {
          type = 'executable',
          command = vim.env.VIRTUAL_ENV .. '/bin/python',
          args = { '-m', 'debugpy.adapter' },
        }
      else
        dap.adapters.python = {
          type = 'executable',
          command = '/usr/bin/python3',
          args = { '-m', 'debugpy.adapter' },
        }
      end

      vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>b', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
    end,
  },

  {
    'mfussenegger/nvim-dap-python',
    config = function()
      -- Update to use the Python interpreter from Mason
      local python_path = vim.fn.exepath 'python3' -- This gives the python interpreter used by Mason
      require('dap-python').setup(python_path)
    end,
  },
}
