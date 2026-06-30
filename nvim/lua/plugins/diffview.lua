vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/sindrets/diffview.nvim',
}, {
  load = true,
})

require('diffview').setup {
  view = {
    merge_tool = {
      layout = 'diff3_mixed',
      disable_diagnostics = true,
      winbar_info = true,
    },
  },
}
