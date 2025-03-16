return {
  'folke/ts-comments.nvim',
  opts = {
    lang = {
      tsx = {
        '// %s', -- Default JS-style comments
        '/* %s */', -- Block comments
        jsx_element = '{/* %s */}', -- JSX-specific comments
        jsx_fragment = '{/* %s */}',
      },
      javascriptreact = {
        '// %s',
        '/* %s */',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
      },
    },
  },
  event = 'VeryLazy',
  enabled = vim.fn.has 'nvim-0.10.0' == 1,
}
