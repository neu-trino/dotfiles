require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		scss = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		prisma = { { "prisma_fmt" } },
	},
	formatters = {
		prisma_fmt = {
			command = "npx",
			args = { "prisma", "format", "--schema", "$FILENAME" },
			stdin = false,
		},
	},
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
})
