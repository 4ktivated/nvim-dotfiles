-- Legacy lazy.nvim specification consumed by custom.plugins.migrated.
return {
  'Wansmer/langmapper.nvim',
  lazy = false,
  priority = 1, -- High priority is needed if you will use `autoremap()`
  config = function()
    require('langmapper').setup {--[[ your config ]]
    }
  end,
}
