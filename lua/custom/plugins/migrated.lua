-- Compatibility bridge for the personal lazy.nvim specs while the configuration
-- uses Neovim 0.12's built-in vim.pack manager.
local function gh(repo)
  return 'https://github.com/' .. repo
end

local specs = {
  bufferline = require 'custom.plugins.buffline',
  go = require 'custom.plugins.go-nvim',
  harpoon = require 'custom.plugins.harpoon',
  indent = require 'custom.plugins.indent',
  langmapper = require 'custom.plugins.langmap',
  minimap = require 'custom.plugins.minimap',
  snacks = require 'custom.plugins.snacks',
  lualine = require 'custom.plugins.supaline',
}

-- Neominimap reads its globals while loading, so its init must run first.
specs.minimap.init()

vim.pack.add {
  gh 'akinsho/bufferline.nvim',
  gh 'nvim-tree/nvim-web-devicons',
  gh 'ray-x/go.nvim',
  gh 'ray-x/guihua.lua',
  { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
  gh 'lukas-reineke/indent-blankline.nvim',
  gh 'Wansmer/langmapper.nvim',
  { src = gh 'Isrothy/neominimap.nvim', version = vim.version.range '3.*' },
  gh 'folke/snacks.nvim',
  gh 'nvim-lualine/lualine.nvim',
  gh 'sainnhe/sonokai',
}

specs.bufferline.init()
specs.go.config()
specs.harpoon.config()
require('ibl').setup(specs.indent.opts)
specs.langmapper.config()
require('snacks').setup(specs.snacks.opts)
require('lualine').setup(specs.lualine.opts)

vim.g.sonokai_enable_italic = true
vim.g.sonokai_style = 'maia'
vim.cmd.colorscheme 'sonokai'
