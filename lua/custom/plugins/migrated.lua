-- Compatibility bridge for personal plugin configurations created before the
-- migration from lazy.nvim to Neovim 0.12's built-in vim.pack manager.
--
-- Existing legacy modules are loaded below so their setup functions and option
-- tables remain the source of truth. New plugins should be implemented as
-- imperative vim.pack modules and therefore do not need an entry in this file.
local function gh(repo)
  return 'https://github.com/' .. repo
end

-- Legacy lazy.nvim-style specifications. These are configuration data only;
-- vim.pack installation and setup are performed explicitly below.
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
local has_ui = #vim.api.nvim_list_uis() > 0

-- Dependencies shared with Kickstart may safely appear here: vim.pack
-- de-duplicates managed plugins by name.
local plugins = {
  gh 'akinsho/bufferline.nvim',
  gh 'nvim-tree/nvim-web-devicons',
  gh 'ray-x/go.nvim',
  gh 'ray-x/guihua.lua',
  { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
  gh 'lukas-reineke/indent-blankline.nvim',
  gh 'Wansmer/langmapper.nvim',
  gh 'folke/snacks.nvim',
  gh 'nvim-lualine/lualine.nvim',
}
if has_ui then
  table.insert(plugins, { src = gh 'Isrothy/neominimap.nvim', version = vim.version.range '3.*' })
  vim.keymap.set('n', '<leader>tm', '<Cmd>Neominimap Toggle<CR>', { desc = 'Toggle global minimap' })
end
vim.pack.add(plugins)

specs.bufferline.init()
-- Preserve each legacy module's setup behavior until it is migrated to a
-- native imperative module.
specs.go.config()
specs.harpoon.config()
require('ibl').setup(specs.indent.opts)
specs.langmapper.config()
require('snacks').setup(specs.snacks.opts)
require('lualine').setup(specs.lualine.opts)
