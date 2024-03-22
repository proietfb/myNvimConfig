return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()
    require('toggleterm').setup({
      open_mapping = [[<c-/>]],
      direction = 'float', -- 'vertical' | 'horizontal' | 'tab'
      auto_scroll = true,
      vim.keymap.set('n','<leader>tt', '<c-/>', {desc = "Toggle Terminal"})
    })
  end
}
