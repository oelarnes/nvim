local M = {}

M.edit = function(path, mode)
    return function()
        if mode == "view" then
            vim.cmd.view(path)
        else
            vim.cmd.edit(path)
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
