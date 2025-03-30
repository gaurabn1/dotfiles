return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      stages = 'fade', -- Notification fade effect
      timeout = 3000, -- Duration in ms
      background_color = '#1e1e1e', -- Background color
      width = 50, -- Width of the notification
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
    }
    vim.notify = require 'notify'
  end,
}
