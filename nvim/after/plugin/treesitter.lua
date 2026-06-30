local ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript" }

local nts = require("nvim-treesitter")

nts.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    pattern = ensure_installed,
    callback = function()
        pcall(vim.treesitter.start)

        pcall(function()
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end)
    end,
})
