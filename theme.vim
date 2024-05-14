" Theme
"
set background=dark     " for the dark version
set termguicolors       " enable true colors support

" " Enable 256-color mode
if &term =~ "xterm-256color" || &term =~ "screen-256color" || &term =~ "screen"
    let &t_Co=256
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
    hi Normal ctermbg=none
    highlight clear LineNr
    highlight LineNr ctermfg=green
endif

" colorscheme darcula-dark


" colorscheme murphy


" PaperColor
" let g:PaperColor_Theme = 'tonger'
colorscheme PaperColor

" gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox
" colorscheme gruvbox

" colorscheme afterglow

" colorscheme tender
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE guifg=#b3deef


" onedark
" colorscheme onedark


" gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox


" xcode
" colorscheme xcodehc
" augroup vim-colors-xcode
"     autocmd!
" augroup END
" 
" autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
" autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic

" Vim Script
" colorscheme monokai-pro

" vim-code-dark
" set t_Co=256
" set t_ut=
" colorscheme codedark


" felipec
" colorscheme felipec
" let g:lightline = { 'colorscheme': 'felipec' }
" let g:airline_theme = 'felipec'


" DIY line number theme

" set signcolumn=number

" set background transparent
" hi Normal guibg=NONE ctermbg=NONE

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

highlight LineNr guifg=#0ed100
highlight LineNr guibg=NONE

" set cursorline
" highlight Cursor ctermfg=#0cb300 ctermbg=green cterm=bold guifg=green guibg=green gui=bold
" highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" highlight CursorLine guibg=#886491 guifg=fg
" highlight CursorLine guibg=#adb089 guifg=fg

" autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
" autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

" set cursorcolumn
" autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" autocmd InsertLeave * highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold guifg=Black guibg=yellow gui=NONE
