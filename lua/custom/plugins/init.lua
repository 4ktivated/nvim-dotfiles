-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Each plugin module installs its packages and configures them directly:
--
--   vim.pack.add { 'https://github.com/owner/plugin.nvim' }
--   require('plugin').setup { ... }
--
-- Keep the setup order explicit: minimap globals are needed before loading its
-- plugin, and langmapper wraps mappings created by subsequent modules.
for _, module in ipairs { 'minimap', 'buffline', 'go-nvim', 'harpoon', 'langmap', 'snacks', 'supaline' } do
  require('custom.plugins.' .. module)
end

-- Discover additional modules. require() skips modules already loaded above.
-- vim.fs.dir() iteration order is unspecified and must not be relied upon.
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
