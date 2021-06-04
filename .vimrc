runtime! debian.vim

if has("syntax")
  syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/vim-gitbranch'
Plug 'w0rp/ale'
let g:ale_set_highlights = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-F> <Plug>(ale_fix eslint)

Plug 'itchyny/lightline.vim'
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
      \ 'separator': { 'left': 'î‚°', 'right': 'î‚²' },
      \ 'subseparator': { 'left': 'î‚±', 'right': 'î‚³' }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
set laststatus=2
set noshowmode

Plug 'xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "âœ¹",
    \ "Staged"    : "âœš",
    \ "Untracked" : "âœ­",
    \ "Renamed"   : "âžœ",
    \ "Unmerged"  : "â•",
    \ "Deleted"   : "âœ–",
    \ "Dirty"     : "âœ—",
    \ "Clean"     : "âœ”ï¸Ž",
    \ 'Ignored'   : 'â˜’',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeGitStatusShowIgnored = 1

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=000
highlight GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=000
highlight GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=000
autocmd BufWritePost * GitGutter

Plug 'raimondi/delimitmate'
Plug 'klen/python-mode'
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0

Plug 'hsanson/vim-android'
let g:android_sdk_path = '/home/victor/Android/Sdk'

Plug 'udalov/kotlin-vim'
Plug 'vim-scripts/grep.vim'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/csv.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

if !has('gui_running')
  set t_Co=256
endif

call plug#end()
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

set number
set tabstop=2
set shiftwidth=2
set relativenumber
set splitright
set showcmd
set splitbelow
