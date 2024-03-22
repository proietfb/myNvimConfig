return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.gopls.setup({})
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Hover info"})
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {desc = "Declaration"})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Definition"})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "Definition"})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "References"})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {desc = "References"})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {desc = "Implementation"})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {desc = "Implementation"})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Actions"})
    end,
  },
}
