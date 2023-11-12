set ignorecase               " case insensitive 
set mouse=v                  " middle-click paste with 
set hlsearch                 " highlight search 
set incsearch                " incremental search
set tabstop=4                " number of columns occupied by a tab 
set softtabstop=4            " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                " converts tabs to white space
set shiftwidth=4             " width for autoindents
set number                   " add line numbers
set wildmode=longest,list    " get bash-like tab completions
syntax on                    " syntax highlighting
set mouse=                   " enable mouse click
set clipboard=unnamedplus    " using system clipboard
filetype plugin on
set ttyfast                  " Speed up scrolling in Vim
set autowrite
set backspace=indent,eol,start
set background=dark
set hlsearch
set autochdir
set laststatus=0 ruler
" set cursorline

" leader key
let mapleader = ","

call plug#begin()
    " theme
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'cypj/tonger-color'
    " lsp
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " go
	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    " switching between a single-line statement and a multi-line one
	Plug 'AndrewRadev/splitjoin.vim'
    " json
	Plug 'elzr/vim-json'
    " git
	Plug 'tpope/vim-fugitive'
 "   Plug 'airblade/vim-gitgutter'
    " file explore
	Plug 'preservim/nerdtree'
    " file change history
	Plug 'mbbill/undotree'
    " quickly comment
	Plug 'preservim/nerdcommenter'                          
    " change scope symbol
    Plug 'tpope/vim-surround'
    " format proto file
    Plug 'rhysd/vim-clang-format'
    " show the code color
    Plug 'norcalli/nvim-colorizer.lua'
    " markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    " file explore | preview
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
    " project root dir
    Plug 'airblade/vim-rooter'
    " browse tags | overview of its structure
    Plug 'preservim/tagbar'
    " navigate and highlight matching words
    Plug 'andymass/vim-matchup'
    " rust
    Plug 'rust-lang/rust.vim'

    " theme
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'arzg/vim-colors-xcode'
    Plug 'tomasiser/vim-code-dark'
    Plug 'felipec/vim-felipec'
    Plug 'arzg/vim-colors-xcode'
call plug#end()

source ~/.config/nvim/theme.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/vim-go.vim
source ~/.config/nvim/rust.vim
source ~/.config/nvim/indent.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/json.vim

" quickfix window
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" jump to the last position in middle window when reopening a file
if has("autocmd")
  au BufWinEnter * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"zz" | endif
endif

" enable folding
set foldmethod=indent
set foldlevel=99
" enable folding with the spacebar
nnoremap <space> za
" quickly exit
nnoremap <leader>q <CMD>q<CR>

" jump buffered file
nnoremap <leader>bb :ls<CR>
nnoremap <leader>bn :bnext<CR>     
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" move line or visually selected block up/down a line.
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right  
" use Ctrl+W H/J/K/L to replace.
" nnoremap <A-h> <C-W>H
" nnoremap <A-j> <C-W>J
" nnoremap <A-k> <C-W>K
" nnoremap <A-l> <C-W>L

" move cursor to left/bottom/top/right pane
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" show cursor line number and column number
set ruler

" python
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" file explore | file preview
nnoremap <C-p> :Telescop find_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" git
nnoremap <leader>gb <CMD>G blame<CR>

" nerdtree
nnoremap <leader>k :NERDTreeToggle<CR>
nnoremap <leader>l :NERDTreeFind<CR>

" nerdtree commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


" preservim/tagbar config {
nnoremap <leader>t :TagbarToggle<CR>

" undotree 
nnoremap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
   let target_path = expand('~/.local/nvim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" clang-format
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" matchup config
let g:matchup_surround_enabled = 1

" set the project root directory
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

" Auto close quickfix window when it's the last window
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
 
" Auto close nerdtree when close vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set signcolumn=number

" set background transparent
hi Normal guibg=NONE ctermbg=NONE

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

" gitgutter
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nmap ]h <Plug>(GitGutterNextHunk)
" nmap [h <Plug>(GitGutterPrevHunk)
" let g:gitgutter
" set signcolumn=yes
" nnoremap <leader>gg <cmd>GitGutterToggle<cr>

" set pumblend=80
set pumheight=30
" hi CocMenuSel ctermbg=237 guibg=#13354A

" neovim register  <--> system clipboard
" " Copy to clipboard
" vnoremap  <leader>y  "+y
" nnoremap  <leader>Y  "+yg_
" nnoremap  <leader>y  "+y
" nnoremap  <leader>yy  "+yy

" " Paste from clipboard
" nnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>p "+p
" vnoremap <leader>P "+P
