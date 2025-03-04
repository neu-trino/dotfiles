vim.g.netrw_banner = 0

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf_request_sync(0, "workspace/executeCommand", {
			command = "_typescript.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(0) },
		})
		require("conform").format({ async = false, lsp_fallback = true })
	end,
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.png", "*.jpg", "*.gif", "*.svg", "*.pdf" },
	callback = function()
		local path = vim.fn.expand("%:p")
		vim.cmd("silent! !xdg-open " .. path .. "> /dev/null 2>&1 &")
		vim.cmd("Ex")
	end,
})
