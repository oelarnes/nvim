-- 
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
--          lowercase                           uppercase                       CTRL-                           <leader>
--          =========                           =========                       =====                           ========
--  a       append                              append EOL                                                    
--  b       back word                           back WORD                       
--  c       change                              c$                              
--  d       delete                              delete EOL                      half-page down
--  e       end of word                         end of WORD                     load init.lua
--  f       find char                           ?find char                      explore cwd
--  g
--  h
--  i
--  j
--  k
--  l
--  m
--  n
--  o
--  p
--  q
--  r
--  s
--  t
--  u
--  v
--  w
--  x
--  y
--  z
--  {[
--  }]
--  \|
--  ;:
--  '"
--  ,<
--  .>
--  /?
--  -_
--  =+
--  `~
--
-- ]
-- the basics
vim.g.mapleader = vim.keycode" "
vim.cmd.inoremap("jk <esc>")
vim.cmd.colorscheme("elflord")
vim.cmd.set("expandtab shiftwidth=4 tabstop=4")
vim.cmd.set("number relativenumber")

-- save
vim.cmd.inoremap("<C-s> <esc>:w<CR>i")
vim.cmd.nnoremap("<C-s> :w<CR>")

-- centering
vim.cmd.nnoremap("<C-d> <C-d>zz")
vim.cmd.nnoremap("<C-u> <C-u>zz")
vim.cmd.nnoremap("n nzz")
vim.cmd.nnoremap("N Nzz")

-- file loading
vim.cmd.nnoremap("<C-e> :e ~/.config/nvim/init.lua<CR>")

-- explorer
vim.cmd.nnoremap("<C-f> :Explore $PWD<CR>")
