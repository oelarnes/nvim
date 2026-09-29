vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.md"},
    callback = function()
        vim.keymap.set("n", "<leader>mc", "Lo```{code-cell}{python}<CR><CR>```<ESC>O", { silent = true, buffer = true })
        vim.keymap.set("n", "<leader>mm", "o```{math}<CR>:enumerated: false<CR><CR>```<ESC>O", { silent = true, buffer = true })
        vim.keymap.set("n", "<leader>ma", "o\\end{align}<ESC>ki\\begin{align}<ESC>o", { silent = true, buffer = true })
    end
})
