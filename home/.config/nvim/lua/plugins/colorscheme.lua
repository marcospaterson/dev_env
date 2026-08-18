return {
  {
    'jakubkarlicek/molokai-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('molokai-nvim').setup({
        italic = false,
      })

      vim.cmd('colorscheme molokai-nvim')

      -- Make the dimmed directory path in the Snacks picker readable
      local colors = require('molokai-nvim').colors()
      vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = colors.comment })
    end,
  },
}
