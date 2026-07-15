-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- New plugin modules should use the Neovim 0.12 API directly:
--
--   vim.pack.add { 'https://github.com/owner/plugin.nvim' }
--   require('plugin').setup { ... }
--
-- Do not copy the `return { ... }` lazy.nvim specifications found in some of
-- the older modules. Those files are retained as configuration data for the
-- compatibility bridge in `custom.plugins.migrated`.

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
