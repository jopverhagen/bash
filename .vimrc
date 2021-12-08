syntax on
filetype plugin on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set laststatus=1
set nowrap
set smartcase
vmap <C-c> "+y
set noswapfile
set hlsearch
set nobackup
set mouse=ar
set incsearch
set clipboard=unnamed
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
call plug#end()
set ttymouse=xterm2
set laststatus=2
nnoremap <esc><esc> :silent! nohls<cr>
colorscheme gruvbox
"colorscheme codedark
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMouseMode=3
set t_Co=256
:set backspace=indent,eol,start

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
map <Enter> o<ESC>
map <S-Enter> O<ESC>
set relativenumber
set t_ut=""
set belloff=all
nnoremap \\ :FZF<CR>
:set guioptions-=T
:set guioptions+=m
" Following three lines remove the auto copy function from VIM
 set guioptions-=a
 set guioptions-=A
 set guioptions-=aA
:set ignorecase
:set smartcase

" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
  if &nu == 1
     set nonu   " turn off nu
     set nornu
  else
     set nu   " turn off rnu
     set rnu
  endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>

let g:closetag_filenames = '*.html,*.xhtml,*.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
