return {
  'rmagatti/goto-preview',
  dependencies = { 'rmagatti/logger.nvim' },
  event = 'BufEnter',
  config = function()
    -- Load the logger.nvim module
    require 'logger'

    -- Setup the goto-preview plugin with the desired configuration
    require('goto-preview').setup {
      width = 120, -- Width of the floating window
      height = 15, -- Height of the floating window
      border = { '↖', '─', '┐', '│', '┘', '─', '└', '│' }, -- Border characters of the floating window
      default_mappings = false, -- Do not bind default mappings
      debug = false, -- Don't print debug information
      opacity = nil, -- No opacity set for the floating window
      resizing_mappings = false, -- Disable arrow keys for resizing the floating window
      post_open_hook = nil, -- No post open hook
      post_close_hook = nil, -- No post close hook
      references = {
        provider = 'telescope', -- Use telescope for the reference window
        telescope = require('telescope.themes').get_dropdown { hide_preview = false },
      },
      focus_on_open = true, -- Focus the floating window when opened
      dismiss_on_move = false, -- Don't dismiss the floating window when moving the cursor
      force_close = true, -- Close floating windows when required
      bufhidden = 'wipe', -- Close the floating window buffer when it's hidden
      stack_floating_preview_windows = false, -- Stack multiple floating preview windows
      same_file_float_preview = true, -- Open preview windows for references in the same file
      preview_window_title = { enable = true, position = 'left' }, -- Show the preview window's title
      zindex = 1, -- Z-index of the floating windows
      vim_ui_input = true, -- Override vim.ui.input with the goto-preview floating window
    }

    -- Key mappings for goto-preview
    vim.keymap.set('n', 'gp', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
    vim.keymap.set('n', 'gpt', "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true })
    vim.keymap.set('n', 'gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
    vim.keymap.set('n', 'gpD', "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true })
    vim.keymap.set('n', 'gP', "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
    vim.keymap.set('n', 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })
  end,
}
