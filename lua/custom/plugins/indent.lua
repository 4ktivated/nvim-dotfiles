-- Legacy lazy.nvim specification consumed by custom.plugins.migrated.
return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'ibl',
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  },
}
