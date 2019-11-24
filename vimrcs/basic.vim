" === setting start ===

set nocompatible
syntax on
filetype off
filetype plugin indent on

set autoindent
set incsearch
set hlsearch
exec "nohlsearch"

set scrolloff=5
" set list
set listchars=tab:⇥\ ,extends:❯,precedes:❮,trail:.,nbsp:~

set tabstop=4
set shiftwidth=4
set softtabstop=4

set pastetoggle=<F2>
set cursorline
set wrap
set wildmenu

if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3
endif

set laststatus=2
set encoding=utf-8           " Set default encoding to UTF-8

set mouse=a                  "  Enable mouse mode
set noerrorbells             " No beeps
set number                   " Show line numbers
set norelativenumber
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set autoread                 " Automatically reread changed files without asking me anything
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
"set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden

set shortmess+=c             " Shut off completion messages
set belloff+=ctrlg           " If Vim beeps during completion

set lazyredraw
set visualbell

set expandtab
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set tw=0
set indentexpr=
set formatoptions-=tc

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" Automatically resize screens to be equally the same
autocmd VimResized * wincmd =

let &t_ut=''

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.php write
" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" === setting end ===


" === mapping start===
let mapleader=";"

nnoremap <silent>R :source %<cr>

inoremap ,, <Esc>
vnoremap ,, <Esc>
inoremap jj <Esc>`^
inoremap kj <Esc>`^
vnoremap kj <Esc>`^

nnoremap <leader>e :e!<cr>
nnoremap <silent> <leader>q :q!<cr>
nnoremap <leader>w :w<cr>
inoremap <leader>w <Esc>:w<cr>
nnoremap <silent>[b :bprevious<cr>
nnoremap <silent>[n :bnext<cr>

noremap te :tabe<cr>
noremap tn :tabnext<cr>
noremap tp :tabprevious<cr>
noremap tc :tabclose<cr>
noremap to :tabo<cr>
noremap tl :tabs<cr>
noremap tmh :-tabmove<cr>
noremap tml :+tabmove<cr>

noremap s <nop>
noremap sl :set  splitright<cr>:vsplit<cr>
noremap sh :set nosplitright<cr>:vsplit<cr>
noremap sj :set  splitbelow<cr>:split<cr>
noremap sk :set nosplitbelow<cr>:split<cr>

noremap <space>l <C-w>l
noremap <space>h <C-w>h
noremap <space>j <C-w>j
noremap <space>k <C-w>k

noremap <up> :resize+5<cr>
noremap <down> :resize-5<cr>
noremap <left> :vertical resize+5<cr>
noremap <right> :vertical resize-5<cr>
noremap <leader>h <C-w>\|
noremap <leader>j <C-w>_
noremap <leader>k <C-w>=

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

nnoremap <leader>; zz
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

noremap H ^
noremap L $
vnoremap H ^
vnoremap L g_

" Remove search highlight
nnoremap <space><cr> :nohlsearch<CR>

" === mapping end ===
