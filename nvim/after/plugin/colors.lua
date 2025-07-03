function PaintVim(color)
	color = color or "tokyonight-moon"
	vim.cmd.colorscheme(color)
	vim.cmd([[highlight SignColumn guibg=none guifg=#88c0d0]])

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

PaintVim()
