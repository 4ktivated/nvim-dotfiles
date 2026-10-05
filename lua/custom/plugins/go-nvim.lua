vim.pack.add {
  'https://github.com/ray-x/guihua.lua',
  'https://github.com/ray-x/go.nvim',
}

-- nvim-lspconfig and nvim-treesitter are configured in init.lua.
-- Go tools are updated by the PackChanged hook in init.lua.
require('go').setup()
-- GoGenerate - генерация моков
