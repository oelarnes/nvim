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
--          lowercase                           uppercase                           CTRL-                           <leader>
--          =========                           =========                           =====                           ========
--  a       append                              append EOL                                                        
--  b       back word                           back WORD                           tmux
--  c       change                              c$                                  close buffer                    colorscheme
--  d       delete                              d$                                  half-page down
--  e       end of word                         end of WORD                                                         edit shortcuts
--  f       find char                           ?find char                          explore cwd
--  g       go                                  goto line                           
--  h       left                                blank line above                    window left                     turn off highlighting
--  i       insert                              insert BOL                          forward in jump stack           
--  j       down                                join lines                          window down
--  k       up                                  help lookup                         window up
--  l       right                               blank line below                    window right                    ls
--  m       mark                                                                 
--  n       next match                          previous match                      next buffer                     toggle numbers
--  o       insert below                        insert above                        back in jump stack
--  p       put                                 put before                          
--  q       record macro                        playback last register              quit                            quality (lint)
--  r       replace                             replace many                        redo
--  s       cl                                  cc                                  save                            system clipboard
--  t       to                                  back to                                                             testing
--  u       undo                                undo line                           half-page up
--  v       visual mode                         visual line                         visual block
--  w       word forward                        WORD forward                        window commands
--  x       delete char                         delete back                  
--  y       yank                                y$                      
--  z       folds                               ZZ/ZQ
--  -_      up linewise and first nonspace      first nonspace char
--  =+      filter <motion> through equalprg    down linewise and first nonspace    
--  [{      backward movements                  up paragraph                        
--  ]}      forward movements                   down paragraph                      into tag
--  \|                                                                              vsplit
--  ;:      next f match                        command
--  '"      
--  ,<
--  .>
--  /?
--  `~
--
-- ]

-- the basics
vim.g.mapleader = vim.keycode" "
vim.cmd.inoremap("jk <esc>u")
vim.cmd.set("expandtab shiftwidth=4 tabstop=4")
vim.cmd.set("number relativenumber")

-- display
vim.cmd.nnoremap("<leader>n :set number! relativenumber!<CR>")
vim.cmd.nnoremap("<leader>h :noh<CR>")
vim.g.have_nerd_font = True

-- save and quit
vim.cmd.inoremap("<C-s> <esc>:w<CR>")
vim.cmd.nnoremap("<C-s> :w<CR>")
vim.cmd.nnoremap("<C-q> :q<CR>")

-- centering
vim.cmd.nnoremap("<C-d> <C-d>zz")
vim.cmd.nnoremap("<C-u> <C-u>zz")
vim.cmd.nnoremap("n nzz")
vim.cmd.nnoremap("N Nzz")
vim.cmd.nnoremap("G Gzz")
vim.cmd.set("scrolloff=10")

-- file loading
vim.cmd.nnoremap("<leader>ei :e ~/.config/nvim/init.lua<CR>")
vim.cmd.nnoremap("<leader>et :e $PWD/.todo.md<CR>")

-- explorer
vim.cmd.nnoremap("<C-f> :Explore $PWD<CR>")

-- window
vim.cmd.nnoremap("<C-h> <C-w>h")
vim.cmd.nnoremap("<C-j> <C-w>j")
vim.cmd.nnoremap("<C-k> <C-w>k")
vim.cmd.nnoremap("<C-l> <C-w>l")
vim.cmd.set("splitright splitbelow")
vim.cmd.nnoremap("<C-\\> :vs<CR>")

-- adding lines
vim.cmd.nnoremap("L o<esc>")
vim.cmd.nnoremap("H O<esc>")

-- buffers
vim.cmd.nnoremap("<C-c> :bd<CR>")
vim.cmd.nnoremap("<C-n> :bn<CR>")
vim.cmd.nnoremap("<C-p> :bp<CR>")

-- commands
vim.cmd.nnoremap("<leader>lb :ls<CR>")
vim.cmd.nnoremap("<leader>ld :!ls<CR>")

-- colorscheme
vim.cmd.nnoremap("<leader>c :colorscheme <C-d>")
vim.cmd.colorscheme("vim")

-- clipboard
vim.cmd.noremap("<leader>sy \"+y")
vim.cmd.noremap("<leader>sp \"+p")
vim.cmd.noremap("<leader>sd \"+d")
vim.cmd.noremap("<leader>sc \"+c")

-- testing
vim.cmd.noremap("<leader>t :!pytest<CR>")

-- quality
vim.cmd.nnoremap("<leader>q :!black -l 100 % & pylint %<CR>")
