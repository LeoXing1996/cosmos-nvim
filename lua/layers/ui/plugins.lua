local cosmos = require('core.cosmos')
local options = require('layers.ui.options')
local configs = require('layers.ui.configs')

cosmos.add_plugin(
  'kyazdani42/nvim-web-devicons',
  {
    config = configs.web_devicons,
  }
)

cosmos.add_plugin(
  'goolord/alpha-nvim',
  {
    after = { 'nvim-web-devicons' },
    config = configs.alpha,
  }
)

cosmos.add_plugin('rafamadriz/neon')

cosmos.add_plugin('Yggdroot/indentLine')

cosmos.add_plugin(
  'p00f/nvim-ts-rainbow',
  {
    after = { 'nvim-treesitter' },
  }
)

cosmos.add_plugin(
  'nvim-lualine/lualine.nvim',
  {
    requires = {
      'arkav/lualine-lsp-progress',
    },
    after = { 'nvim-web-devicons' },
    config = configs.lualine,
  }
)

cosmos.add_plugin(
  'akinsho/bufferline.nvim',
  {
    after = { 'nvim-web-devicons' },
    config = configs.bufferline,
  }
)

cosmos.add_plugin('onsails/lspkind-nvim')

if options.enable_smooth_scrolling then
  cosmos.add_plugin(
    'karb94/neoscroll.nvim',
    {
      config = configs.neoscroll,
    }
  )
end

if options.enable_beacon then
  cosmos.add_plugin('danilamihailov/beacon.nvim')
end
