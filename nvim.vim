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
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'fatih/molokai'

	" Go
	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'posva/vim-vue', { 'for': 'vue' }

	Plug 'elzr/vim-json'
	Plug 'pangloss/vim-javascript'

	Plug 'tpope/vim-fugitive'
	
	Plug 'preservim/nerdtree'
	Plug 'mbbill/undotree'
    " quickly comment
	Plug 'preservim/nerdcommenter'                          
    Plug 'mhinz/vim-startify'

	" Statue line
	" Plug 'vim-airline/vim-airline'
    
    Plug 'andymass/vim-matchup'
    " Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tarekbecker/vim-yaml-formatter'

    " terraform
    Plug 'hashivim/vim-terraform'
    Plug 'vim-syntastic/syntastic'
    Plug 'juliosueiras/vim-terraform-completion'

call plug#end()


" ====================== theme config ========================
colorscheme PaperColor
" colorscheme molokai
let g:rehash256 = 1
let g:molokai_original = 1
hi Normal ctermbg=none
highlight clear LineNr
highlight LineNr ctermfg=green

" " Enable 256-color mode
" if &term =~ "xterm-256color" || &term =~ "screen-256color" || &term =~ "screen"
"     let &t_Co=256
"     let &t_AF="\e[38;5;%dm"
"     let &t_AB="\e[48;5;%dm"
"     hi Normal ctermbg=none
"     highlight clear LineNr
"     highlight LineNr ctermfg=green
" endif
"

" matchup config
let g:matchup_surround_enabled = 1


" ====================== vim-go config ======================
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" let g:go_list_type = "quickfix"
" let g:go_fmt_command = "goimports"
" " highlight
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1
" " check
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_deadline = "2s"
" " golines
" let g:go_fmt_command = "golines"
" let g:go_fmt_options = {
"    \ 'golines': '-m 128',
"    \ }

let g:go_auto_sameids = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_experimental = 1
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" share :GoPlay
let g:go_play_open_browser = 0
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
" Identifier highlighting
let g:go_auto_sameids = 0
" let g:go_fmt_fail_silently = 1
" let g:go_addtags_transform = "camelcase"


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



" coc config {
	let g:coc_node_path = '/Users/cyp/env/node/bin/node'
	" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
	" utf-8 byte sequence
	set encoding=utf-8
	" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup
	
	" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
	" delays and poor user experience
	set updatetime=300
	
	" Always show the signcolumn, otherwise it would shift the text each time
	" diagnostics appear/become resolved
	" set signcolumn=true
	
	" Use tab for trigger completion with characters ahead and navigate
	" NOTE: There's always complete item selected by default, you may want to enable
	" no select by `"suggest.noselect": true` in your configuration file
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config
	inoremap <silent><expr> <TAB>
	      \ coc#pum#visible() ? coc#pum#next(1) :
	      \ CheckBackspace() ? "\<Tab>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	
	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	
	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	
	" Use <c-space> to trigger completion
	if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
	  inoremap <silent><expr> <c-@> coc#refresh()
	endif
	
	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)
	
	" GoTo code navigation
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	
	" Use K to show documentation in preview window
	nnoremap <silent> K :call ShowDocumentation()<CR>
	
	function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
	    call CocActionAsync('doHover')
	  else
	    call feedkeys('K', 'in')
	  endif
	endfunction
	
	" Highlight the symbol and its references when holding the cursor
	autocmd CursorHold * silent call CocActionAsync('highlight')
	
	" Symbol renaming
	nmap <leader>rn <Plug>(coc-rename)
	
	" Formatting selected code
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)
	
	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s)
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end
	
	" Applying code actions to the selected code block
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)
	
	" Remap keys for applying code actions at the cursor position
	nmap <leader>ac  <Plug>(coc-codeaction-cursor)
	" Remap keys for apply code actions affect whole buffer
	nmap <leader>as  <Plug>(coc-codeaction-source)
	" Apply the most preferred quickfix action to fix diagnostic on the current line
	nmap <leader>qf  <Plug>(coc-fix-current)
	
	" Remap keys for applying refactor code actions
	nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
	xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
	nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
	
	" Run the Code Lens action on the current line
	nmap <leader>cl  <Plug>(coc-codelens-action)
	
	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)
	
	" Remap <C-f> and <C-b> to scroll float windows/popups
	if has('nvim-0.4.0') || has('patch-8.2.0750')
	  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif
	
	" Use CTRL-S for selections ranges
	" Requires 'textDocument/selectionRange' support of language server
	nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)
	
	" Add `:Format` command to format current buffer
	command! -nargs=0 Format :call CocActionAsync('format')
	
	" Add `:Fold` command to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)
	
	" Add `:OR` command for organize imports of the current buffer
	command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
	
	" Add (Neo)Vim's native statusline support
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline
	" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}%{StatusDiagnostic()}
	
	" Mappings for CoCList
	" Show all diagnostics
	nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item
	nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item
	nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }

" Python config {
    autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
" }

" CtrlP config {
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
	" confirm the starting directory
	" 'c' - the directory of the current file.
	" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
	" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
	" 'w' - modifier to "r": start search from the cwd instead of the current file's directory
	" 0 or '' (empty string) - disable this feature.
	let g:ctrlp_working_path_mode = 'ra' 
	let g:ctrlp_root_markers = ['pom.xml', '.p4ignore'] 	" use mark to determine starting directory
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip 	" exclude files
	let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" }

" elzr/vim-json {
	let g:vim_json_syntax_conceal = 0
" } 


" nerdtree config {
	" nnoremap <leader>n :NERDTreeFocus<CR>
	" nnoremap <C-t> :NERDTree<CR>
	nnoremap <leader>k :NERDTreeToggle<CR>
	nnoremap <leader>l :NERDTreeFind<CR>
" }

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
" }

" lua <<EOF
" require('tabnine').setup({
"   disable_auto_comment=true,
"   accept_keymap="<Tab>",
"   dismiss_keymap = "<C-]>",
"   debounce_ms = 800,
"   suggestion_color = {gui = "#808080", cterm = 244},
"   exclude_filetypes = {"TelescopePrompt"}
" })
" EOF

