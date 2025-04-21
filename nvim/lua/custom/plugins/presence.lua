return {
  'andweeb/presence.nvim',
  config = function()
    require('presence').setup {
      -- General options:
      client_id = '1350510040255299635',
      auto_update = true, -- Automatically update presence
      log_level = 'debug',
      debounce_timeout = 0,
      enable_line_number = true,
      blacklist = {},
      buttons = true,
      file_assets = {},
      show_time = true,

      -- Rich Presence text options
      editing_text = 'Editing %s',
      file_explorer_text = 'Browsing %s',
      git_commit_text = 'Committing changes',
      plugin_manager_text = 'Managing plugins',
      reading_text = 'Reading %s',
      workspace_text = 'Working on %s',
      line_number_text = 'Line %s out of %s',
    }
  end,
}
