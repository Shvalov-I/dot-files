vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/benomahony/oil-git.nvim',
}, {
  load = true,
})

require('oil').setup {
  columns = { 'icon' },
  keymaps = {
    ['<C-h>'] = false,
    ['<M-h>'] = 'actions.select_split',
  },
  -- view_options = {
  --   show_hidden = true,
  -- },
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
