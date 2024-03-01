let g:copilot_proxy = 'localhost:7890'

let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")
imap <C-N> <Plug>(copilot-next)
imap <C-P> <Plug>(copilot-previous)
