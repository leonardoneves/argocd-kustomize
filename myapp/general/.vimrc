
" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

colorscheme murphy
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set nu
set ai
