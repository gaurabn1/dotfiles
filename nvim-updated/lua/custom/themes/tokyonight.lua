return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    -- vim.cmd.colorscheme 'tokyonight-night'

    vim.cmd.hi 'Comment gui=none'
    -- Transparent
    -- vim.cmd [[
    --   " global transparency settings
    --   hi normal guibg=none ctermbg=none
    --   hi normalnc guibg=none ctermbg=none
    --   hi vertsplit guibg=none ctermbg=none
    --   hi statusline guibg=none ctermbg=none
    --   hi linenr guibg=none ctermbg=none
    --   hi signcolumn guibg=none ctermbg=none
    --   hi endofbuffer guibg=none ctermbg=none
    --   hi cursorlinenr guibg=none ctermbg=none
    --   hi pmenu guibg=none ctermbg=none
    --   hi pmenusel guibg=none ctermbg=none
    --   hi search guibg=none ctermbg=none
    --   hi incsearch guibg=none ctermbg=none
    --   hi tabline guibg=none ctermbg=none
    --   hi tablinesel guibg=none ctermbg=none
    --   hi tablinefill guibg=none ctermbg=none
    --   hi nvimtreenormal guibg=none ctermbg=none
    --   hi nvimtreestatusline guibg=none ctermbg=none
    --   hi nvimtreewinseparator guibg=none ctermbg=none
    --   hi winbar guibg=none ctermbg=none
    --   hi winbarnc guibg=none ctermbg=none
    -- ]]
  end,
}
