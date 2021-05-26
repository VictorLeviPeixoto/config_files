runtime! debian.vim

if has("syntax")
  syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

call plug#begin('~/.vim/plugged')
Plug 'udalov/kotlin-vim'
Plug 'hsanson/vim-android'
Plug 'raimondi/delimitmate'
Plug 'airblade/vim-gitgutter'
Plug 'klen/python-mode'
Plug 'vim-scripts/grep.vim'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/csv.vim'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'w0rp/ale'
call plug#end()

let g:ale_set_highlights = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-F> <Plug>(ale_fix eslint)
set encoding=utf-8
scriptencoding utf-8
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
set laststatus=2
set noshowmode

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1

let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

highlight GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=000
highlight GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=000
highlight GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=000
autocmd BufWritePost * GitGutter

let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0

let g:android_sdk_path = '/home/victor/Android/Sdk'


if !has('gui_running')
  set t_Co=256
endif

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

set number
set tabstop=2
set shiftwidth=2
set relativenumber
