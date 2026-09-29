local M = {}

M.edit = function(path, mode)
    return function()
        local expanded = vim.fn.expand(path)
        if mode == "view" then
            vim.cmd.view(expanded)
        else
            vim.cmd.edit(expanded)
        end
    end
end

M.do_these = function(fns)
    return function()
        for _, fn in ipairs(fns) do
            fn()
        end
    end
end

M.toggle = function(opt)
    return function()
        vim.o[opt] = not vim.o[opt]
    end
end

return M
