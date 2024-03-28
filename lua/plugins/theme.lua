return {
	{
		"navarasu/onedark.nvim",
		-- "AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				-- require("nordic").setup({
				style = "warm",
			})
			require("onedark").load()
			-- require("nordic").load()
		end,
	},
}
