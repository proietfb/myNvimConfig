return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        numbers = "none",
        diagnostic = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or ""
          return " " .. icon .. count
        end
      },
    })
  end
}
