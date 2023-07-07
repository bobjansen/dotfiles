execute pathogen#infect()

set history=700

filetype plugin on
filetype indent on

set autoread
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set smartcase
set hlsearch
set incsearch
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set autochdir
set number

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set ai
set si
set wrap

let mapleader = ","
let g:mapleader = ","

imap jj <Esc>
nmap <leader>r :redraw!<cr>
nmap <leader>w :w!<cr>
nmap <leader>c :cnext<cr>
nmap <leader>r :!/home/brj/code/hackerrank/attribute_parser/make.sh<cr>

syntax enable

if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
    set guifont=Monospace:h11
    set guifont=
endif

map j gj
map k gk

map <silent> <leader><cr> :noh<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>bd :Bclose<cr>

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif

set viminfo^=%

set laststatus=2

command! DeleteTrailingWhitespace call <SID>DeleteTrailingWS()
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.tex :call DeleteTrailingWS()
autocmd BufWrite *.sql :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.scala :call DeleteTrailingWS()
autocmd BufWrite *.jl :call DeleteTrailingWS()
autocmd BufWrite *.R :call DeleteTrailingWS()
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.tpp :call DeleteTrailingWS()
autocmd BufWrite *.Rmd :call DeleteTrailingWS()


au BufNewFile,BufRead,BufEnter *.tpp set filetype=cpp
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.tpp set omnifunc=omni#cpp#complete#Main

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line as bad.
match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
match BadWhitespace /\s\+$/

map <leader>q gqq
map <leader>n :TagbarToggle<CR>
map <leader>s :split<CR>
map <leader>p :cd %:p:h<CR>

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" colors zenburn
colorscheme zenburn
set background=dark

au! FileType python setl nosmartindent

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd FileType rust let g:syntastic_rust_checkers = ['cargo']

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
autocmd FileType go map <buffer> <leader>d :GoDef<CR>
autocmd FileType go map <buffer> <leader>b :GoBuild<CR>
autocmd FileType go map <buffer> <leader>t :GoTest<CR>
autocmd FileType go map <buffer> <leader>i :GoInstall<CR>
autocmd FileType go map <buffer> <leader>f :GoFmt<CR>
