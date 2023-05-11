"" ___  ___      _   _        _                    
" |  \/  |     | \ | |      (_)                   
" | .  . |_   _|  \| |_   ___ _ __ ___  _ __ ___ 
" | |\/| | | | | . ` \ \ / / | '_ ` _ \| '__/ __|
" | |  | | |_| | |\  |\ V /| | | | | | | | | (__ 
" \_|  |_/\__, \_| \_/ \_/ |_|_| |_| |_|_|  \___|
"          __/ |                                 
"         |___/                                  
"
" Author: Zelong Guo @ GFZ, Potsdam
" Email: zelong.guo@outlook.com 
"

" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYNVIMRC
endif

" ++++++++++++++++++++++++++++++ Some VIM Setting ++++++++++++++++++++++++++++++
let mapleader = " "
syntax enable
syntax on
set autochdir
set number
set relativenumber
set cursorline
set cursorcolumn
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
"set ignorecase
"set colorcolumn=100
"Mouse is not allowed
set mouse=

noremap j h
noremap i k
noremap k j
noremap J 7h
noremap I 5k
noremap K 5j
noremap L 7l
" go to start of the line
noremap <C-j> 0
" go to end of the line
noremap <C-l> $
noremap h i
noremap H I
noremap M L
noremap <LEADER><CR> :nohlsearch<CR>

" Insert and Visual mode return Esc
inoremap jk <Esc>
vnoremap jk <Esc>
" The following part of auto-completion about double parenthesis has moved to all.snippets
" Auto backspace when typing double parenthesis
" inoremap "" ""<++><Esc>4hi
" inoremap '' ''<++><Esc>4hi
" inoremap () ()<++><Esc>4hi
" inoremap {} {}<++><Esc>4hi
" inoremap [] []<++><Esc>4hi
" inoremap <> <><++><Esc>4hi
" inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" Press space twice to jump to the next '<++>' and edit it, i.e., place holder
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

map s <nop>
map S :w<CR>
map Q :q<CR>
" Here we automatically resize the windowns of iTerm2 and Chrome with the apple script
map R :call ResizeWindow4MP()<CR>
map E :call RecoverWindows()<CR>
"++++++++++++++++++++++++++++++ Self-defining Function ++++++++++++++++++++++++++++++
func ResizeWindow4MP()
	exec "silent ! osascript  ~/.config/AppleScript/resize_windows.scpt"
	exec ":MarkdownPreview"
	" you can use command + tab to change the current focus to item
	" exec "silent ! osascript  ~/.config/AppleScript/reactivate_iTerm.scpt"
endfunc
func RecoverWindows()
	exec "silent ! osascript  ~/.config/AppleScript/recover_window.scpt"
endfunc
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" split the screen, change between window and resize the window
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" some VI/VIM settings
set nocompatible
set backspace=indent,eol,start
"set mouse=a
"set list
let laststatus=2
set scrolloff=5

"++++++++++++++++++++++++++++++ Self-defining Function ++++++++++++++++++++++++++++++
" Add the files header automatically
autocmd BufNewFile *.sh exec ":call SetTitle4sh()"
func SetTitle4sh()
	call setline(1,"#!/bin/bash")
	call append(1," ")
	call append(2, "# Zelong Guo, ".strftime("%d.%m.%Y"))
	call append(3," ")
	normal G
endf
autocmd BufNewFile *.py exec ":call SetTitle4py()"
func SetTitle4py()
	call setline(1,"#!/usr/bin/env python")
	call append(1," ")
	normal G
endf

" Shortcut key for GMT to add some pre-settings: Press F4
" map <F4> ms:call SetSettings4gmt()<CR>'s
map <F4> :call SetSettings4gmt()<CR>
func SetSettings4gmt()
	call append(4, "gmt set MAP_FRAME_PEN 1p")
	call append(5, "gmt set FONT_ANNOT_PRIMARY 8p")
	call append(6, "gmt set FONT_ANNOT_SECONDARY 7p")
	call append(7, "gmt set FONT_LABEL 8p")
	call append(8, "gmt set MAP_TICK_LENGTH 0.1c")
	call append(9, "gmt set MAP_FRAME_TYPE Plain")
	call append(10, "gmt set MAP_ANNOT_OFFSET_PRIMARY 1p")
	call append(11, "gmt set MAP_ANNOT_OFFSET_SECONDARY 1p")
	call append(12, "gmt set MAP_LABEL_OFFSET 1.5p")
	call append(13, "gmt set MAP_ANNOT_OBLIQUE lat_parallel")
	call append(14, " ")
	call append(15, " ")
	call append(16, "gmt begin <++> tif")
	call append(17, " ")
	call append(18, " ")
	call append(19, "gmt end show")
	call append(20, "rm gmt*")
endf

" Quickly Run with One Click and Standard Output to quickfix (with
" asyncrun.vim plugin)
map <F5> :call CompileRunGcc()<CR>
func CompileRunGcc()
	" save the file firstly
	exec 'w'
	if &filetype == 'sh'
		":!time bash %
		:AsyncRun! time bash %
		:copen
	elseif &filetype == 'python'
		exec "AsyncRun! time python %"
		exec "copen"
	elseif &filetype == 'c'
		exec "AsyncRun! g++ % -o %<"
		exec "copen"
	elseif &filetype == 'cpp'
		exec "AsyncRUn! g++ % -o %<"
		exec "copen"
	endif
endfunc


"++++++++++++++++++++++++++++++ Install Plugins +++++++++++++++++++++++++++++++
" to install your plugin, just copy the plugin name from github to the below
" section, and then type:
" PlugInstall
" to install your plug, just comment the below corresponding plug, and then
" delete it under the .vim/plugged directory. 

call plug#begin('$HOME/.config/nvim/plugged')
" Color Scheme
Plug 'ZelongGuo/nvim-deus'
Plug 'ZelongGuo/eleline.vim'
Plug 'tpope/vim-fugitive'
"Plug 'connorholyday/vim-snazzy'

" Bookmarks
Plug 'kshenoy/vim-signature'

" A small plugin for standard output to quickfix window
" it's good implemetation for GMT, for Python debugging you can install
" vimspector plugin
"Plug 'skywind3000/asyncrun.vim'

" Git
"Plug 'mhinz/vim-signify'

" markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown'}
" then you should run :call mkdp#util#install() to activate the markdownpreview, in case more errors you can find in the github page of markdown-preview.nvim
" Plug 'SirVer/ultisnips',{'for':'markdown'} " Important, in this case, snippets is only valid for markdown
Plug 'SirVer/ultisnips'

"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'
call plug#end()


" "======
" " markdown noremap under insert mode
" " Now the followings have been migrated to markdown.snippets
" "======
" autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" " Bold text
" autocmd Filetype markdown inoremap <buffer> ,b ****<++><left><left><left><left><left><left>
" " Italic text
" autocmd Filetype markdown inoremap <buffer> ,i **<++><left><left><left><left><left>
" " deleted text
" autocmd Filetype markdown inoremap <buffer> ,d ~~~~<++><left><left><left><left><left><left>
" " link
" autocmd Filetype markdown inoremap <buffer> ,a [](<++>)<++><Esc>F[a
" " pictures
" "autocmd Filetype markdown inoremap <buffer> ,p ![](<++>)<++><Esc>F[a
" autocmd Filetype markdown inoremap <buffer> ,p <div align=center><img src="" width="<++>%" height="auto"></div><++><Esc>Fr3la
" " enter to next line
" "autocmd Filetype markdown inoremap ,p ![](<++>)<++><Esc>F[a
" " Color text
" autocmd Filetype markdown inoremap <buffer> ,c <font size="3"  color="red"></font><++><Esc>F>F>a
" " Background color
" autocmd Filetype markdown inoremap <buffer> ,bc <table><tr><td bgcolor=gray></td></tr></table><++><Esc>Fyla
" " " Mathematical formula
" " autocmd Filetype markdown inoremap <buffer> m<Tab>  $$<++><left><left><left><left><left>
" " autocmd Filetype markdown inoremap <buffer> M<Tab>  $$$$<++><left><left><left><left><left><left>
" " autocmd Filetype markdown inoremap <buffer> f<Tab>  \frac{}{<++>}<Esc>F{F{a


"++++++++++++++++++++++++++++++ Plugins Settings +++++++++++++++++++++++++++++++
"======
" vim-table-mode
"======
map <LEADER>tm :TableModeToggle<CR>

"======
" vim-snazzy
"======
"colorscheme snazzy

" ==================== eleline.vim ====================
let g:eleline_powerline_fonts = 0

" ==================== Dress up my vim ====================
"set termguicolors 
" enable true colors support
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" nvim-deus settings
silent! color deus

"hi NonText ctermfg=gray guifg=gray10
"hi SpecialKey ctermfg=blue guifg=grey70
"hi CursorLine guibg=gray20 ctermbg=black

" ==================== Markdown Preview ====================
" More info refer to the webpage of markdown-previer.nvim
" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" ==================== ultisnips ====================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

" if &filetype ==# 'markdown'
" The folder contains the markdown.snippets, configrations can be refered to: " https://github.com/cold-soda-jay/Markdown-vim
" if you want use Ultisnips, e.g., in zsh, you can create zsh.snippets under the following directory
" refer to: https://github.com/honza/vim-snippets/tree/master/UltiSnips
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/']
let g:UltiSnipsEditSplit="vertical"

