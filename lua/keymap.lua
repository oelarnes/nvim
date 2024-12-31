-- 
-- 
--                           _   _ ______ ______      _______ __  __        _  __________     ____  __          _____  
--                          | \ | |  ____/ __ \ \    / /_   _|  \/  |      | |/ /  ____\ \   / /  \/  |   /\   |  __ \ 
--                          |  \| | |__ | |  | \ \  / /  | | | \  / |      | ' /| |__   \ \_/ /| \  / |  /  \  | |__) |
--                          | . ` |  __|| |  | |\ \/ /   | | | |\/| |      |  < |  __|   \   / | |\/| | / /\ \ |  ___/ 
--                          | |\  | |___| |__| | \  /   _| |_| |  | |      | . \| |____   | |  | |  | |/ ____ \| |     
--                          |_| \_|______\____/   \/   |_____|_|  |_|      |_|\_\______|  |_|  |_|  |_/_/    \_\_|     
--                                                                                                                     
--

local u = require("custom.utils")
local map = vim.keymap.set
-- display
map('n', "<leader>n", u.do_these{u.toggle('number'), u.toggle('relativenumber')})
map('n', "<leader>h", function() vim.o.hlsearch = false end)
map('i', 'jk', '<esc>u')
map({'v', 'i'}, "<C-s>", "<esc>:w<CR>")
map('n', "<C-s>", ":w<CR>")
map('n', "<C-q>", ":q<CR>")

-- centering
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "G", "Gzz")

-- file loading
map("n", "<leader>ei", u.edit("~/.config/nvim/init.lua"))
map("n", "<leader>ek", u.edit("~/.config/nvim/lua/keymap.lua"))
map("n", "<leader>eo", u.edit("~/.config/nvim/lua/options.lua"))
map("n", "<leader>eu", u.edit("~/.config/nvim/lua/custom/utils.lua"))
map("n", "<leader>et", u.edit("$PWD/.todo.md"))
map("n", "<leader>ez", u.edit("~/.config/nvim/lua/config/lazy.lua"))
map("n", "<leader>ec", ":e ~/.config/nvim/")
map("n", "<leader>ed", ":e %:h/")

map("n", "<leader>vi", u.edit("~/.config/nvim/init.lua", "view"))
map("n", "<leader>vk", u.edit("~/.config/nvim/lua/keymap.lua", "view"))
map("n", "<leader>vo", u.edit("~/.config/nvim/lua/options.lua", "view"))
map("n", "<leader>vu", u.edit("~/.config/nvim/lua/custom/utils.lua", "view"))
map("n", "<leader>vt", u.edit("$PWD/.todo.md", "view"))
map("n", "<leader>vz", u.edit("~/.config/nvim/lua/config/lazy.lua", "view"))
map("n", "<leader>vc", ":view ~/.config/nvim/")
map("n", "<leader>vd", ":view %:h/")
-- explorer
map("n", "<C-f>", ":Explore $PWD<CR>")
map("n", "<C-e>", ":Explore<CR>")

-- window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-\\>", u.do_these{vim.cmd.vsplit, vim.cmd.bprevious})

-- visual mode
map("v", "K", ":'<'>m'<-2<CR>gv=gv")
map("v", "J",  ":'<'>m'>+1<CR>gv=gv")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- editing
map("n", "L", "o<esc>")
map("n", "H", "O<esc>")

-- insert 
map("n", "<leader>ik", "^f r<C-v>u2713j^l", { desc = "insert ✓" })

-- buffers
map("n", "<C-c>", ":bd<CR>")
map("n", "<C-n>", ":bn<CR>")
map("n", "<C-p>", ":bp<CR>")

-- commands
map("n", "<leader>lb", ":ls<CR>")
map("n", "<leader>ld", ":!ls<CR>")

-- colorscheme
map("n", "<leader>c", ":colorscheme <C-d>")

-- system clipboard
map({"n", "v"}, "<leader>sy", "\"+y")
map({"n", "v"}, "<leader>sp", "\"+p")
map({"n", "v"}, "<leader>sd", "\"+d")
map({"n", "v"}, "<leader>sc", "\"+c")

-- testing

-- source
map("n", "<leader>x", ":source<CR>")
