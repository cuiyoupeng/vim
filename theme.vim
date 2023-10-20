" Theme
" colorscheme murphy
"
" PaperColor
" set termguicolors       " enable true colors support
" set background=dark     " for the dark version
" let g:PaperColor_Theme = 'tonger'
" colorscheme PaperColor
" highlight LineNr ctermfg=green

" " Enable 256-color mode
" if &term =~ "xterm-256color" || &term =~ "screen-256color" || &term =~ "screen"
"     let &t_Co=256
"     let &t_AF="\e[38;5;%dm"
"     let &t_AB="\e[48;5;%dm"
"     hi Normal ctermbg=none
"     highlight clear LineNr
"     highlight LineNr ctermfg=green
" endif


" onedark
" colorscheme onedark


" gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

" xcode
" colorscheme xcodedark

" vim-code-dark
" set t_Co=256
" set t_ut=
" colorscheme codedark

" felipec
" colorscheme felipec
" let g:lightline = { 'colorscheme': 'felipec' }
" let g:airline_theme = 'felipec'
