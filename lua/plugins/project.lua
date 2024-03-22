return  {
   "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup ({
      require('telescope').load_extension('projects'),
      vim.keymap.set('n',"<leader>po", "<cmd>Telescope projects<cr>", {desc="Open Projects"}),
      vim.keymap.set('n',"<leader>pa", "<cmd>ProjectRoot<cr>", {desc="Add Project"})
    })
  end
}
