syntax on                                       "enable syntax highlight
filetype plugin indent on       "decision indent from filetype
set autoindent                          "auto indent at creating new line
set expandtab                           "Change tab to space
set tabstop=4                           "define tab as 4 space
set shiftwidth=4                        "the number of space using as auto indent

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme murphy                      "change color scheme

"""""""""myself""""""""
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け

""""""""about search""""""""
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る


"mapping
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
noremap <c-q> <c-w><c-q>
noremap <S-h> 0
noremap <S-l> $

noremap <c-t> :belowright :terminal<CR>
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>""""")

"indentline"
let g:indentLine_color_term =239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

let g:tex_conceal=''
set backspace=indent,eol,start