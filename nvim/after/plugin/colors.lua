function PaintVim(color)
	vim.cmd.colorscheme(color)

	local statusline_hl = vim.api.nvim_get_hl(0, { name = "StatusLine", link = false })
	local float_title_hl = vim.api.nvim_get_hl(0, { name = "FloatTitle", link = false })

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE", fg = statusline_hl.fg })
	vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE", fg = statusline_hl.fg })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = statusline_hl.fg })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = statusline_hl.fg })
	vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE", fg = float_title_hl.fg })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = float_title_hl.fg })
end

PaintVim("tokyonight-moon")
