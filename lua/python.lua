vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.py",
    callback = function()
        vim.keymap.set("n", "<leader>q", ":!ruff format %<CR>", { silent = true, buffer = true })
        vim.keymap.set("n", "<leader>t", ":!pytest<CR>", { silent = true, buffer = true })
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local map = function(k, f, desc)
            vim.keymap.set("n", k, f, { buffer = ev.buf, desc = desc })
        end
        map("gd",         vim.lsp.buf.definition,   "Go to definition")
        map("K",          vim.lsp.buf.hover,         "Hover docs")
        map("<leader>rn", vim.lsp.buf.rename,        "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action,   "Code action")
        map("gr",         vim.lsp.buf.references,    "References")
        map("[d",         vim.diagnostic.goto_prev,  "Prev diagnostic")
        map("]d",         vim.diagnostic.goto_next,  "Next diagnostic")
        map("<leader>e",  vim.diagnostic.open_float, "Diagnostic detail")
    end
})
