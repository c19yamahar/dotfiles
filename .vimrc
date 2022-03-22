syntax on
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme murphy


set number
set title
set showmatch
syntax on

set ignorecase
set smartcase
set wrapscan


noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
noremap <c-q> <c-w><c-q>
noremap <S-h> 0
noremap <S-l> $

noremap <c-t> :belowright :terminal<CR>
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>""""")

let g:indentLine_color_term =239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

let g:tex_conceal=''
set backspace=indent,eol,start