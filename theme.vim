" Theme
"
set termguicolors       " enable true colors support
set background=dark     " for the dark version
let g:PaperColor_Theme = 'tonger'
colorscheme PaperColor
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
