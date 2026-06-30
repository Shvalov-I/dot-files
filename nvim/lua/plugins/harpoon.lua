vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  {
    src = 'https://github.com/ThePrimeagen/harpoon',
    version = 'harpoon2',
  },
}, {
  load = true,
})

local harpoon = require 'harpoon'

harpoon:setup {
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  },
  settings = {
    save_on_toggle = true,
  },
}

vim.keymap.set('n', '<leader>h', function() harpoon:list():add() end, { desc = '[H]arpoon File' })

vim.keymap.set('n', '<leader>H', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon Quick Menu' })

vim.keymap.set('n', '<leader>j', function() harpoon:list():select(1) end, { desc = 'Harpoon to File 1' })

vim.keymap.set('n', '<leader>k', function() harpoon:list():select(2) end, { desc = 'Harpoon to File 2' })

vim.keymap.set('n', '<leader>l', function() harpoon:list():select(3) end, { desc = 'Harpoon to File 3' })

vim.keymap.set('n', '<leader>;', function() harpoon:list():select(4) end, { desc = 'Harpoon to File 4' })
