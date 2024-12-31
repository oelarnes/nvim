-- see ~/.config/nvim/lua/custom/keymap.lua for keymap    

-- the basics
vim.g.mapleader = vim.keycode" "

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        "catppuccin/nvim",
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            config = function()
                require'nvim-treesitter.configs'.setup {
                    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                    ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                    auto_install = true,
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },
                }
            end,
	},
        {
            "neovim/nvim-lspconfig",
            config = function()
                local cfg = require("lspconfig")
                cfg.pyright.setup{}
                cfg.ruff.setup{}
                cfg.lua_ls.setup{
                    on_init = function(client)
                        if client.workspace_folders then
                            local path = client.workspace_folders[1].name
                            ---@diagnostic disable-next-line: undefined-field
                            if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                                return
                            end
                        end

                        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                            runtime = {
                                version = 'LuaJIT'
                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME
                                }
                            }
                        })
                    end,
                    settings = {
                        Lua = {}
                    }
                }
            end
        },
        {
            "williamboman/mason.nvim",
            opts = {}, -- calls .setup()
        },
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('telescope').setup({})

                -- telescope
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
                vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
                vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
                vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            end
        },
    },
   -- automatically check for plugin updates
    checker = { enabled = true },
})

vim.cmd.colorscheme("catppuccin")

require('keymap')
require('options')
require('python')


