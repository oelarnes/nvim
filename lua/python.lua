vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.py"},
    callback = function()
        vim.keymap.set("n", "<leader>q", ":!ruff format %<CR>", { silent = true, buffer = true })
        vim.keymap.set("n", "<leader>t", ":!pytest<CR>", { silent = true, buffer = true})
    end
})
