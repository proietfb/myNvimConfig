---@diagnostic disable: undefined-global
return {
    {
      'nvim-telescope/telescope-ui-select.nvim'
    },
    {
      'nvim-telescope/telescope.nvim',
      -- tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require("telescope").setup({
          extensions = {
           ["ui-select"] = {
             require("telescope.themes").get_dropdown({}),
           },
         },
       })
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live grep"})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "File buffers"})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "help tags"})
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "Recent files"})
        vim.keymap.set('n', '<leader>sh', builtin.search_history, {desc = "Search History"})
        vim.keymap.set('n', '<leader>sf', builtin.current_buffer_fuzzy_find, {desc = "Search current buffer fzf"})
        vim.keymap.set('n', '<leader>sm', builtin.marks, {desc = "Search marks"})
        vim.keymap.set('n', '<leader>kk', builtin.keymaps, {desc = "Telescope normal Keymap"})
--        vim.keymap.set('n', '<leader>fc',function() require('telescope').Cd('$HOME/.config/nvim') end, {desc = "Neovim config"})

        require("telescope").load_extension("ui-select")
      end
  }
}
