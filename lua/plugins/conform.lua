return {
	"stevearc/conform.nvim",
	opts = {},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "clangd" },
					cpp = { "clangd" },
					go = { "goimports", "gofmt" },
					json = { { "prettierd", "prettier" } },
					markdown = { { "prettierd", "prettier" } },
					erb = { "htmlbeautifier" },
					html = { "htmlbeautifier" },
					bash = { "shfmt" },
					rust = { "rustfmt" },
					yaml = { "yamlfix" },
					toml = { "taplo" },
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "codespell" },
					-- Use the "_" filetype to run formatters on filetypes that don't
					-- have other formatters configured.
					["_"] = { "trim_whitespace" },
				},
				format_on_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_fallback = true }
				end,

				vim.keymap.set({ "n", "v" }, "<leader>cf", function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 500,
					})
				end, { desc = "Format file or range (in visual mode)" }),

				vim.keymap.set("n", "<leader>ct", function()
					if vim.g.disable_autoformat or vim.b.disable_autoformat then
						vim.cmd("FormatEnable")
					else
						vim.cmd("FormatDisable")
					end
				end, { desc = "Disable auto-format file on save" }),
			})
		end,

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		}),
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		}),
	},
}
