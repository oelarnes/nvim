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
            "folke/which-key.nvim",
            event = "VeryLazy",
            keys = {
                {
                    "<leader>?", function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
            },
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
            "lervag/vimtex",
            lazy = false,
            init = function()
                vim.g.vimtex_view_method = "zathura"
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
        {
            'Vigemus/iron.nvim',
            config = function()
                local iron = require("iron.core")
                local view = require("iron.view")
                local common = require("iron.fts.common")
                iron.setup {
                    config ={
                        -- Whether a repl should be discarded or not
                        scratch_repl = true,
                        -- Your repl definitions come here
                        repl_definition = {
                          sh = {
                            -- Can be a table or a function that
                            -- returns a table (see below)
                            command = {"zsh"}
                          },
                          python = {
                            command = { "ipython", "--no-autoindent" },  -- or { "ipython", "--no-autoindent" }
                            format = common.bracketed_paste_python,
                            block_deviders = { "# %%", "#%%" },
                          }
                       }, ---@diagnostic disable-next-line: unused-local
                       repl_filetype = function(bufnr, ft)
                          return ft
                       end,
                       repl_open_cmd = view.split.vertical.botright("50%")
                    },
                    keymaps = {
                        toggle_repl = "<space>rr", -- toggles the repl open and closed.
                        -- If repl_open_command is a table as above, then the following keymaps are
                        -- available
                        -- toggle_repl_with_cmd_1 = "<space>rv",
                        -- toggle_repl_with_cmd_2 = "<space>rh",
                        restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
                        send_motion = "<space>sc",
                        visual_send = "<space>sc",
                        send_file = "<space>sf",
                        send_line = "<space>sl",
                        send_paragraph = "<space>sp",
                        cr = "<space>s<cr>",
                        interrupt = "<space>s<space>",
                        exit = "<space>sq",
                        clear = "<space>sr",
                    },
                      -- If the highlight is on, you can change how it looks
                      -- For the available options, check nvim_set_hl
                    highlight = {
                        italic = true
                    },
                    ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
                }
                vim.keymap.set('n', '<leader>sw', '<leader>sciW', { remap = true, desc = 'iron_repl_send_word' })
            end
        }
    },
   -- automatically check for plugin updates
    checker = { enabled = true },
})

vim.cmd.colorscheme("catppuccin")

require('keymap')
require('options')
require('python')


