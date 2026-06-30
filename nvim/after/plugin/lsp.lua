local function on_attach(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "gt", function()
		vim.lsp.buf.type_definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({
			border = "single",
		})
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help({
			border = "single",
		})
	end, opts)
	vim.keymap.set("n", "<leader>voi", function()
		if vim.bo[0].filetype == "typescript" or vim.bo[0].filetype == "typescriptreact" then
			vim.lsp.buf.execute_command({
				command = "_typescript.organizeImports",
				arguments = { vim.fn.expand("%:p") },
			})
		else
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" } },
				apply = true,
			})
		end
	end)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        on_attach(client, event.buf)
    end
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "eslint", "jsonls", "lua_ls" },
})

vim.lsp.config("ts_ls", {
    on_attach = on_attach
})

vim.lsp.config("eslint", {
    on_attach = on_attach
})

vim.lsp.config("jsonls", {
    on_attach = on_attach
})

vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { "vim" }
        }
    }
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	--	window = {
	--		completion = cmp.config.window.bordered(),
	--		documentation = cmp.config.window.bordered(),
	--	},
})
