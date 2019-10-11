" === plugins start ===

call plug#begin('~/.vim/plugged')

Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'brooth/far.vim'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'

call plug#end()


silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif

" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore = [
      \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
      \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
      \ ]

" === FZF
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

" search
nmap <C-p> :FzfHistory<cr>
imap <C-p> <esc>:<C-u>FzfHistory<cr>

" search across files in the current directory
nmap <C-b> :FzfFiles<cr>
imap <C-b> <esc>:<C-u>FzfFiles<cr>

let g:rg_command = '
      \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
      \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
      \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)


" 定义函数，自动插入文件头
autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"
func! SetTitle()
  if &filetype == 'python'
    call setline(1, "\#!/usr/bin/env python3")
    call setline(2, "\# -*- coding:utf-8 -*-")
    normal G
    normal o
    normal o
    call setline(5, "if __name__ == '__main__':")
    call setline(6, "    pass")
  elseif &filetype == 'sh'
    call setline(1, "#!/usr/bin/env bash")
    normal G
    normal o
    normal o
  endif
endfunc

" Open Startify
map <LEADER>st :Startify<CR>

" color
syntax enable
set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

nnoremap <F5> :UndotreeToggle<cr>

" ===  nerdcommenter start
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" ===  nerdcommenter end

" === vim-easy-align start
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" === vim-easy-align end
" === autoformat start
" au BufWrite * :Autoformat
autocmd FileType python noremap <leader>p :Autoformat<cr>
" === autoformat end

" === easymotion start
" map <Leader><Leader>w <Plug>(easymotion-w)
" map <Leader><Leader>f <Plug>(easymotion-f)
" map <Leader><Leader>b <Plug>(easymotion-b)
nmap ss <Plug>(easymotion-s2)
" nmap sd <Plug>(easymotion-s)
" nmap sf <Plug>(easymotion-overwin-f)
" map  sh <Plug>(easymotion-linebackward)
" map  sl <Plug>(easymotion-lineforward)
" map  s/ <Plug>(easymotion-sn)
" omap s/ <Plug>(easymotion-tn)
" map  sn <Plug>(easymotion-next)
" map  sp <Plug>(easymotion-prev)
" === easymotion end

"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
  let s:input_status = system("fcitx-remote")
  if s:input_status == 2
    let g:input_toggle = 1
    let l:a = system("fcitx-remote -c")
  endif
endfunction

function! Fcitx2zh()
  let s:input_status = system("fcitx-remote")
  if s:input_status != 2 && g:input_toggle == 1
    let l:a = system("fcitx-remote -o")
    let g:input_toggle = 0
  endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

" === plugins end ===

