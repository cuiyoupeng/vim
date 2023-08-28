" Vim UI
" set guicursor=i:block
" set nocompatible             " disable compatibility to old-time vi
" set showmatch                " show matching 
set ignorecase             " case insensitive 
set mouse=v                  " middle-click paste with 
set hlsearch                 " highlight search 
set incsearch                " incremental search
set tabstop=4                " number of columns occupied by a tab 
set softtabstop=4            " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                " converts tabs to white space
set shiftwidth=4             " width for autoindents
" set autoindent               " indent a new line the same amount as the line just typed
set number                   " add line numbers
set wildmode=longest,list    " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on    " allow auto-indenting depending on file type
syntax on                    " syntax highlighting
set mouse=                   " enable mouse click
" set mousehide
set clipboard=unnamedplus    " using system clipboard
filetype plugin on
" set cursorline             " highlight current cursorline
set ttyfast                  " Speed up scrolling in Vim
" set spell                  " enable spell check (may need to download language package)
" set noswapfile             " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set autowrite
set backspace=indent,eol,start
set background=dark
set hlsearch
set autochdir
set laststatus=0 ruler


" mapleader
let mapleader = ","

" vv to generate new vertical split
nnore map <silent> vv <C-w>v
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <leader>vz :VimuxZoomRunner<CR>

" General {
    " copies filepath to clipboard by pressing yf
    :nnoremap <silent> yf :let @+=expand('%:p')<CR>
    " copies pwd to clipboard: command yd
    :nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

    " jump to the last position in middle window when reopening a file
	if has("autocmd")
	  au BufWinEnter * if line("'\"") > 0 && line("'\"") <= line("$")
	    \| exe "normal! g'\"zz" | endif
	endif

	" Enable folding
	set foldmethod=indent
	set foldlevel=99
	" Enable folding with the spacebar
	nnoremap <space> za
    " quickly exit
    nnoremap <leader>q <CMD>q<CR>

    " change buffer
    nnoremap <leader>bn :bnext<CR>
    nnoremap <leader>bp :bprevious<CR>
    " close buffer
    nnoremap <leader>bd :bdelete<CR>
" }

" Navigation {
    " move line or visually selected block - alt+j/k
    inoremap <C-j> <Esc>:m .+1<CR>==gi
    inoremap <C-k> <Esc>:m .-2<CR>==gi
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv
    " move split panes to left/bottom/top/right
    " nnoremap <A-h> <C-W>H
    " nnoremap <A-j> <C-W>J
    " nnoremap <A-k> <C-W>K
    " nnoremap <A-l> <C-W>L
    " move between panes to left/bottom/top/right
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
" }


call plug#begin()
	" Vim UI
	" Plug 'NLKNguyen/papercolor-theme'
    " Plug 'ayu-theme/ayu-vim'
	" Plug 'fatih/molokai'
    " Colorschemes
    Plug 'EdenEast/nightfox.nvim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'preservim/nerdcommenter'
    Plug 'cypj/tonger-color'
    Plug 'altercation/vim-colors-solarized'
    Plug 'ayu-theme/ayu-vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'dikiaap/minimalist'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'rakr/vim-one'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Go
	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
	Plug 'AndrewRadev/splitjoin.vim'
	" Plug 'ctrlpvim/ctrlp.vim'
	Plug 'posva/vim-vue', { 'for': 'vue' }

	Plug 'elzr/vim-json'
	Plug 'pangloss/vim-javascript'

	Plug 'tpope/vim-fugitive'
	
	Plug 'preservim/nerdtree'
	Plug 'mbbill/undotree'
    " quickly comment
	Plug 'preservim/nerdcommenter'                          
    " Plug 'mhinz/vim-startify'

	" Statue line
	" Plug 'vim-airline/vim-airline'
    
    " Plug 'andymass/vim-matchup'
    " Plug 'jiangmiao/auto-pairs'
    " Plug 'tpope/vim-surround'
    " Plug 'tarekbecker/vim-yaml-formatter'

    " terraform
    " Plug 'hashivim/vim-terraform'
    " Plug 'vim-syntastic/syntastic'
    " Plug 'juliosueiras/vim-terraform-completion'

    " Plug 'dense-analysis/ale'

    Plug 'rhysd/vim-clang-format'

    " Plug 'norcalli/nvim-colorizer.lua'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " Search file in vim
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Root dir
    Plug 'airblade/vim-rooter'

    Plug 'preservim/tagbar'

call plug#end()




set ruler
" theme config
source ~/.config/nvim/theme.vim
" coc config 
source ~/.config/nvim/coc.vim
" vim-go
source ~/.config/nvim/vim-go.vim





" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)


" Python config {
    autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
" }

" fzf config {
    " nnoremap <C-p> :FZF<CR>
" }

" Telescop config {
    nnoremap <C-p> :Telescop find_files<CR>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }

" elzr/vim-json {
	let g:vim_json_syntax_conceal = 0
" } 

" vim-fugitive config {
    nnoremap <leader>gb <CMD>G blame<CR>
" }


" nerdtree config {
	" nnoremap <leader>n :NERDTreeFocus<CR>
	" nnoremap <C-t> :NERDTree<CR>
	nnoremap <leader>k :NERDTreeToggle<CR>
	nnoremap <leader>l :NERDTreeFind<CR>
" }
" preservim/tagbar config {
    nnoremap <leader>t :TagbarToggle<CR>
" {

hi Search ctermbg=Green
" hi Search ctermfg=White


" undotree config {
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
" }


" airline config {
	" show files in buffer
	" let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#buffer_nr_show = 1
    " let g:bufferline_echo = 0
    " let g:airline#extensions#tabline#buffer_min_count =2
    "" remove the filetype part
    " let g:airline_section_x=''
    " remove separators for empty sections
    " let g:airline_skip_empty_sections = 1 
    " set ambiwidth=double
    " if ! has("gui_running")
    "     let g:loaded_airline = 1
    " endif
" }


" c config
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']



" Language: apiblueprint
au FileType apiblueprint set expandtab
au FileType apiblueprint set shiftwidth=4
au FileType apiblueprint set softtabstop=4
au FileType apiblueprint set tabstop=4

" Language: Bash
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

" Language: C++
au FileType cpp set expandtab
au FileType cpp set shiftwidth=4
au FileType cpp set softtabstop=4
au FileType cpp set tabstop=4

" Language: CSS
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

" Language: gitcommit
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

" Language: fish
au FileType fish set expandtab
au FileType fish set shiftwidth=2
au FileType fish set softtabstop=2
au FileType fish set tabstop=2

" Language: gitconfig
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

" Language: HTML
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

" Language: JavaScript
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

" Language: JSON
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

" Language: LESS
au FileType less set expandtab
au FileType less set shiftwidth=2
au FileType less set softtabstop=2
au FileType less set tabstop=2

" Language: Make
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

" Language: Markdown
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

" Language: PlantUML
au FileType plantuml set expandtab
au FileType plantuml set shiftwidth=2
au FileType plantuml set softtabstop=2
au FileType plantuml set tabstop=2

" Language: Protobuf
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2

" Language: Python
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

" Language: Ruby
au FileType ruby set expandtab
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

" Language: SQL
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

" Language: Thrift
au FileType thrift set expandtab
au FileType thrift set shiftwidth=2
au FileType thrift set softtabstop=2
au FileType thrift set tabstop=2

" Language: TOML
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2

" Language: TypeScript
au FileType typescript set expandtab
au FileType typescript set shiftwidth=4
au FileType typescript set softtabstop=4
au FileType typescript set tabstop=4

" Language: Vader
au FileType vader set expandtab
au FileType vader set shiftwidth=2
au FileType vader set softtabstop=2
au FileType vader set tabstop=2

" Language: vimscript
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

" Language: YAML
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

" lua require'colorizer'.setup()

" Markdown Preview Config
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'
