set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set paste
set hidden
"au FileType py CommentStyle #
let mapleader = "."

filetype plugin indent on

"tab for indent
autocmd FileType python setlocal et sta sw=4 sts=4 
autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd QuickFixCmdPost * :cw

"display ruler
set ruler
"highlight code
syntax on
set hlsearch
"file path
set titlestring=%F

"color
set t_Co=256

if &t_Co == 256 || has('gui_running')
    colorscheme desert256   " Or some other high-color scheme
else
    colorscheme desert      " Or some other low-color scheme
endif


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my bundle here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'KevinGoodsell/vim-xterm-colors'
Bundle 'Lokaltog/vim-powerline'
Bundle 'erikw/tmux-powerline'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'sjbach/lusty'
"Bundle 'vim-scripts/FuzzyFinder'


" vim-scripts repos on vim.org
Bundle 'L9' 
Bundle 'python.vim'
Bundle 'TaskList.vim'
"Bundle 'minibufexpl.vim'
Bundle 'pythoncomplete'
Bundle 'vim-misc'
"Bundle 'ctags.vim'
Bundle 'easytags.vim'
Bundle 'vim-colorscheme-switcher'
Bundle 'molokai'
Bundle 'Solarized'
Bundle 'gui2term.py'
"Bundle 'taglist.vim'
"smilar to taglist
Bundle 'Tagbar' 
"cscope plugin
Bundle 'autoload_cscope.vim'
"non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'LustyExplorer'
Bundle 'VimExplorer'
Bundle 'winmanager'
Bundle 'Command-T'
Bundle 'comments.vim'
Bundle 'Pydiction'
Bundle 'vimgrep.vim'
Bundle 'linepower.vim'
Bundle 'vcscommand.vim'

"NERDTerr
map <F1> :NERDTreeToggle<CR>
map <C-F1> :NERDTreeFind<CR>
let NERDChristmasTree = 1
let NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeHijackNetrw=1
let NERDTreeCaseSensitiveSort=1 
"nmap <F7> <ESC>:NERDTreeToggle<RETURN>
"autocmd BufRead *  25vsp  ./

"CommandT
nnoremap <silent> <C-l> :CommandT<CR>
nnoremap <silent> <C-t> :CommandTBuffer<CR>

"Related with code indent
set autoindent " same level indent
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"vimgrep 
noremap <F3> :vimgrep /<C-R>=expand("<cword>")<CR>/j *.txt *.cpp *.h *.py *.java *.lua<CR> \| :copen<CR>
"noremap <F7> :vimgrep /<C-R>=expand("<cword>")<CR>/j **/*.txt **/*.cpp **/*.h **/*.py **/*.java **/*.lua<CR> \| :copen<CR>
"noremap <C-F7> :vimgrep /<C-R>=expand("<C-R>+")<CR>/j **/*.txt **/*.cpp **/*.h **/*.py **/*.java **/*.lua<CR> \|:copen<CR>

"ctags
"map <F2> :!ctags -R --fields=+lS <CR>

"tagbar
let g:tagbar_ctags_bin ='/home/xjian/bin/ctags/bin/ctags'
let g:tagbar_left = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

"pydiction
let g:pydiction_location ='/home/xjian/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 10

"taglist
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"let Tlist_Ctags_Cmd='/home/xjian/bin/ctags/bin/ctags'

"tags
set tags=tags
set autochdir

"cscope setting
" Use both cscope and ctag
set cscopetag
"set nocst  "only search the cscope.out file
"order tag first
set csto=1
" Show msg when cscope db added
set cscopeverbose
" Use tags for definition search first
set cscopetagorder=1
" Use quickfix window to show cscope results
set cscopequickfix=s-,c-,d-,i-,t-,e-

"autocscope_load
let g:autocscope_menus=0

"easytags
let g:easytags_cmd='/home/xjian/bin/ctags/bin/ctags'
let g:easytags_updatetime_warn = 0

"MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne=0
" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

"Omnicompletion

"Lusty
"let g:LustyExplorerSuppressRubyWarning = 1

"FuzzyFinder
nnoremap <leader>ff :FufFile<CR> 
nnoremap <leader>fb :FufBuffer<CR>
"winmanager


""powerline{ 
"let g:Powerline_symbols = 'compatible'
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
set guifont=PowerlineSymbols\ for\ Powerline 
set t_Co=256 
let g:Powerline_symbols = 'fancy' 
let g:Powerline_stl_path_style ='relative'
let g:Powerline_theme = 'solarized16'
let g:Powerline_mode_n = 'N'
"let g:Powerline_stl_path_style ='relative'
"}

" Brief help  
" " :BundleList          - list configured bundles  
" " :BundleInstall(!)    - install(update) bundles  
" " :BundleSearch(!) foo - search(or refresh cache first) for foo   
" " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  
" "     
" " see :h vundle for more details or wiki for FAQ   
" " NOTE: comments after Bundle command are not allowed..
