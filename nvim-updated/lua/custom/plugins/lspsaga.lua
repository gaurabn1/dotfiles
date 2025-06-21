return {
  'nvimdev/lspsaga.nvim', -- Plugin name
  event = 'LspAttach', -- Load when LSP attaches
  config = function()
    require('lspsaga').setup {} -- Setup lspsaga with default config
  end,
}
