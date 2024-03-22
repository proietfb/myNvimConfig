return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>b"] = { name="Buffer"},
      ["<leader>f"] = { name="File"},
      ["<leader>g"] = { name="Go to"},
      ["<leader>c"] = { name="Code"},
      ["<leader>k"] = { name="Keymaps"},
      ["<leader>x"] = { name="Diagnostic"},
      ["<leader>w"] = { name="Windows"},
      ["<leader>v"] = { name="Version Control"},
      ["<leader>s"] = { name="Search"},
      ["<leader>t"] = { name="Toggle/Terminal"},
      ["<leader>bb"] = { "<cmd>Telescope buffers<cr>", "List"},
      ["<leader>bd"] = { "<cmd>bdelete<cr>", "Close"},
      ["<leader>bp"] = { "<cmd>lua require('bufferline.groups').toggle_pin()<cr>", "Pin"},
      ["<leader>b1"] = { "<cmd>lua require('bufferline').go_to(1, true)<cr>", "Go to 1"},
      ["<leader>b2"] = { "<cmd>lua require('bufferline').go_to(2, true)<cr>", "Go to 2"},
      ["<leader>b3"] = { "<cmd>lua require('bufferline').go_to(3, true)<cr>", "Go to 3"},
      ["<leader>b4"] = { "<cmd>lua require('bufferline').go_to(4, true)<cr>", "Go to 4"},
      ["<leader>b5"] = { "<cmd>lua require('bufferline').go_to(5, true)<cr>", "Go to 5"},
      ["<leader>b6"] = { "<cmd>lua require('bufferline').go_to(6, true)<cr>", "Go to 6"},
      ["<leader>b7"] = { "<cmd>lua require('bufferline').go_to(7, true)<cr>", "Go to 7"},
      ["<leader>b8"] = { "<cmd>lua require('bufferline').go_to(8, true)<cr>", "Go to 8"},
      ["<leader>b9"] = { "<cmd>lua require('bufferline').go_to(9, true)<cr>", "Go to 9"},
      ["<leader>fn"] = { "<cmd>enew<cr>", "New file"},
      ["<leader>fs"] = { "<cmd>w<cr>", "Save file"},
      ["<leader>fS"] = { "<cmd>wa<cr>", "Save all file"},
      ["<leader>ft"] = { "<cmd>Neotree toggle<cr>", "Toggle Neotree"},
      ["<leader>ka"] = { "<cmd>WhichKey<cr>", "All"},
      ["<leader>wl"] = { "<c-w>l<cr>", "Move to Right"},
      ["<leader>wh"] = { "<c-w>h<cr>", "Move to Left"},
      ["<leader>wk"] = { "<c-w>k<cr>", "Move to Up"},
      ["<leader>wj"] = { "<c-w>j<cr>", "Move to Down"},
      ["<leader>wd"] = { "<c-w>q<cr>", "Close current window"},
      ["<leader>w/"] = { "<cmd>vsplit<cr>", "Vertical Split"},
      ["<leader>w-"] = { "<cmd>splitbelow<cr>", "Horizontal Split"},
      ["<leader>l"] = { "<cmd>Lazy<cr>", "Lazy"},
      ["<leader><Tab>"] = { "b#<cr>", "Go to last tab"},
      ["H"] = { "<cmd>bprevious<cr>", "Previous Buffer"},
      ["L"] = { "<cmd>bnext<cr>", "Next Buffer"},
    })
  end
}
