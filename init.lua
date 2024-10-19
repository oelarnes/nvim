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
--  c       change                              c$                              close buffer
--  d       delete                              delete EOL                      half-page down
--  e       end of word                         end of WORD                     load init.lua
--  f       find char                           ?find char                      explore cwd
--  g       go                                  goto line                       
--  h       left                                blank line above                window left                     turn off highlighting
--  i       insert                              insert BOL                      forward in jump stack       
--  j       down                                join lines                      window down
--  k       up                                  help lookup                     window up
--  l       right                               blank line below                
--  m       mark                                
--  n       next match                          previous match                  next buffer
--  o       insert below                        insert above                    back in jump stack
--  p       put                                 put before                      
--  q       record macro                        playback last register          quit
--  r       replace                             replace many                    redo
--  s       cl                                  c$                              save
--  t       to                                  back to                         
--  u       undo                                undo line                       half-page up
--  v       visual mode                         visual line                     visual block
--  w       word forward                        WORD forward                    window commands
--  x       delete char                         delete back                 
--  y       yank                                yank lines                      
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
vim.cmd.nnoremap("<leader>h :noh<CR>")

-- save and quit
vim.cmd.inoremap("<C-s> <esc>:w<CR>i")
vim.cmd.nnoremap("<C-s> :w<CR>")
vim.cmd.nnoremap("<C-q> :q<CR>")

-- centering
vim.cmd.nnoremap("<C-d> <C-d>zz")
vim.cmd.nnoremap("<C-u> <C-u>zz")
vim.cmd.nnoremap("n nzz")
vim.cmd.nnoremap("N Nzz")
vim.cmd.nnoremap("G Gzz")

-- file loading
vim.cmd.nnoremap("<C-e> :e ~/.config/nvim/init.lua<CR>")

-- explorer
vim.cmd.nnoremap("<C-f> :Explore $PWD<CR>")

-- window
vim.cmd.nnoremap("<C-h> <C-w>h")
vim.cmd.nnoremap("<C-j> <C-w>j")
vim.cmd.nnoremap("<C-k> <C-w>k")
vim.cmd.nnoremap("<C-l> <C-w>l")

vim.cmd.nnoremap("L o<esc>")
vim.cmd.nnoremap("H O<esc>")

-- buffers
vim.cmd.nnoremap("<C-c> :bd<CR>")
vim.cmd.nnoremap("<C-n> :bn<CR>")
vim.cmd.nnoremap("<C-p> :bp<CR>")
