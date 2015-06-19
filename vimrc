" C-p 按照文件名字模糊搜索当前目录下文件

" C-h vsp左右分屏时向左跳转光标
" C-l vsp左右分屏时向右跳转光标
" C-j sp上下分屏时向右跳转光标
" C-k sp上下分屏时向右跳转光标

" ,fu 列出本文件函数并模糊搜索，使用C-j / C-k 上下移动
" ,sf 在文件夹内搜索光标所在处的关键字

" Golang begin
" <Leader>i 显示函数定义
" C-i | gd 跳转到函数定义处
" Golang end


" command[1..9] command键加数字键1-9跳转到相应标签页

"go get -u github.com/jstemmer/gotags
"
":noh 搜索之后取消本次高亮
"
"C-p 列出最近打开文件，输入当前文件夹下想打开的文件名称
"C-j C-k 上下移动，当移动到想打开的文件C-t 在新的tab中打开文件
"C-v 横向分屏打开文件
"
"
"在需要搜索的单词下面,sf可打开搜索框，同样C-j C-k上下移动，
"o / enter打开光标所在文件
"t 在新tab中打开文件
"p 在预览窗口中打开文件，此时再按q关闭预览框
"O 打开文件，保持搜索窗口开启
"T 在新tab中打开文件，但是光标不移动，当需要打开多个搜索到的文件时可以
"q 退出搜索窗口



set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set ruler                             " show the cursor position all the time
set autoread                          " auto read when file is changed from outside
set wrap
set linebreak
set nolist
set hidden
set linespace=0
set cursorline
set nofoldenable
set number
set numberwidth=4
set title
set showmode
set nobomb                            " no BOM(Byte Order Mark)
set nostartofline
set laststatus=2
set clipboard+=unnamed
set splitright                        " always open vertical split window in the right side
set splitbelow                        " always open horizontal split window below
set scrolloff=5                       " start scrolling when n lines away from margins
set switchbuf=useopen
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set key=			                        " disable encryption
set synmaxcol=0
set viminfo='20,f1,<50                " 为1000个文件保存信息，保存全局标记，viminfo采用500行的上限
set ttyfast                           " send more chars while redrawing
set hlsearch                          " search highlighting
set incsearch                         " incremental search
set t_Co=256
set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shortmess=Ia                      " remove splash wording
"set fdm=marker
"set fdm=syntax
"set foldenable

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" cursorline switched while focus is switched to another split window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

let mapleader=","

set shell=/bin/bash

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
 "PluginInstall
 "PluginUpdate
 "PluginClean
 "PluginList
 "PluginSearch

Plugin 'bling/vim-airline'

Plugin 'fatih/vim-go'
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>e <Plug>(go-rename)
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_fmt_autosave = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_command = "goimports"

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Bundle 'Shougo/neocomplete'
  let g:neocomplete#enable_smart_case = 1
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3

Plugin 'kien/ctrlp.vim'         
 let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

Plugin 'tacahiroy/ctrlp-funky'
  let g:ctrlp_extensions = ['funky']
  nnoremap <Leader>fu :CtrlPFunky<Cr>
  nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

Plugin 'dyng/ctrlsf.vim'
  nnoremap <Leader>sf :CtrlSF<Cr>

Plugin 'Raimondi/delimitMate'
  let g:delimitMate_expand_cr = 1
  let g:delimitMate_expand_space = 1

Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq = 1
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_enable_highlighting = 0
highlight SyntasticErrorSign guifg=white guibg=black

call vundle#end()
filetype plugin indent on
syntax on                             " syntax highlight

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"VSP分屏的时候用来跳转窗口
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"command + 数字键，跳转tab
"MVIM下，终端里面可能会有冲突
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt
"":nn <D-1> 1gt
"":nn <D-2> 2gt
"":nn <D-3> 3gt
"":nn <D-4> 4gt
"":nn <D-5> 5gt
"":nn <D-6> 6gt
"":nn <D-7> 7gt
"":nn <D-8> 8gt
"":nn <D-9> 9gt

"jump to last cursor position when opening a file
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal! g`\""
    normal! zz
  endif
endfunction

set guifont=Monaco:h12
