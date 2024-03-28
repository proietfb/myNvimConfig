return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = true,
    show_hidden = false,
    exclude_dirs = { "build_*", ".venv", "venv" },
    patterns = { ".git", ".svn", "Makefile", "CMakeLists.txt", ".scuba.yml", ".scuba.yaml", ".deps.udm" },
  },
  keys = {
    {
      "<leader>pm",
      function()
        require("telescope").extensions.cder.cder()
        vim.cmd("ProjectRoot")
      end,
      desc = "Add new project",
    },
    { "<leader>sp", "<Cmd>Telescope live_grep<CR>", desc = "Grep in Project" },
    { "<leader>pp", "<Cmd>Telescope projects<CR>", desc = "Find Project" },
    { "<leader>pf", "<Cmd>Telescope find_files<CR>", desc = "Find files in project" },
    {
      "<leader>pl",
      function()
        vim.cmd("tabnew")
        require("telescope").extensions.projects.projects()
      end,
      desc = "Open new workspace with project",
    },
    {
      "<leader>pc",
      function()
        vim.cmd("tabclose")
      end,
      desc = "Close current project",
    },
  },
}
