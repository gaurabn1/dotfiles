return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap-python',
    'stevearc/overseer.nvim',
  },
  keys = {
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    local pythonPath = function()
      local cwd = vim.loop.cwd()
      if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return vim.fn.executable 'python3' == 1 and 'python3' or '/usr/bin/python'
      end
    end

    local set_python_dap = function()
      require('dap-python').setup() -- earlier so setup the various defaults ready to be replaced
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = pythonPath(),
        },
        {
          type = 'python',
          request = 'launch',
          name = 'DAP Django',
          program = vim.loop.cwd() .. '/manage.py',
          args = { 'runserver', '--noreload' },
          justMyCode = true,
          django = true,
          console = 'integratedTerminal',
        },
        {
          type = 'python',
          request = 'attach',
          name = 'Attach remote',
          connect = function()
            return {
              host = '127.0.0.1',
              port = 5678,
            }
          end,
        },
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file with arguments',
          program = '${file}',
          args = function()
            local args_string = vim.fn.input 'Arguments: '
            return vim.split(args_string, ' +')
          end,
          console = 'integratedTerminal',
          pythonPath = pythonPath(),
        },
      }

      dap.adapters.python = {
        type = 'executable',
        command = pythonPath(),
        args = { '-m', 'debugpy.adapter' },
      }
    end

    set_python_dap()
    vim.api.nvim_create_autocmd({ 'DirChanged' }, {
      callback = function()
        set_python_dap()
      end,
    })

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {},
    }

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
