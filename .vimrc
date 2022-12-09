autocmd BufNewFile *.cpp silent! 0r ~/Dropbox/.cabecalho/cpp.txt
autocmd BufNewFile *.cpp silent! exe "1," . 14 . "g/File: .*/s//File: " . expand("%:t:r") . ".cpp"
autocmd BufNewFile *.cpp silent! exe "1," . 14 . "g/Data: .*/s//Data: " . strftime("%d-%m-%y_2")
autocmd BufNewFile *.cpp silent! exe "1," . 14 . "g/#ifndef .*/s//#ifndef ".expand("%:t:r").".cpp"
autocmd BufNewFile *.cpp silent! exe "1," . 14 . "g/#define .*/s//#define ".expand("%:t:r").".cpp"

autocmd BufNewFile *.h 0r ~/Dropbox/.cabecalho/fileh.txt
autocmd BufNewFile *.h silent! exe "1," . 14 . "g/File: .*/s//File: ".expand("%:t:r") . ".h"
autocmd BufNewFile *.h silent! exe "1," . 14 . "g/Data: .*/s//Data: ".strftime("%d-%m-%y_2")
autocmd BufNewFile *.h silent! exe "1," . 14 . "g/#ifndef .*/s//#ifndef ".expand("%:t:r")."_h"
autocmd BufNewFile *.h silent! exe "1," . 14 . "g/#define .*/s//#define ".expand("%:t:r")."_h"

" autocmd BufNewFile *.cpp silent! 0r ~/Dropbox/.mainGrafo/cpp.txt
" autocmd BufNewFile *.cpp silent! exe "1," . 25 . "g/File: .*/s//File: " . expand("%:t:r") . ".cpp"
" autocmd BufNewFile *.cpp silent! exe "1," . 25 . "g/Data: .*/s//Data: " . strftime("%d-%m-%y_22")
"
" source $VIMRUNTIME/vimrc_example.vim

autocmd BufNewFile *.java silent! 0r ~/Dropbox/.cabecalho/java.txt
autocmd BufNewFile *.java silent! exe "1," . 14 . "g/File: .*/s//File: " . expand("%:t:r") . ".java"
autocmd BufNewFile *.java silent! exe "1," . 14 . "g/Data: .*/s//Data: " . strftime("%d-%m-%y_22")
autocmd BufNewFile *.java silent! exe "1," . 14 . "g/class .*/s//class " . expand("%:t:r")." {"
autocmd BufNewFile *.java silent! exe "1," . 16 . "g/public .*/s//public " . expand("%:t:r")."(){"

" public class App
"salva a útima linha de edição 
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif 
set foldmethod=syntax
set wrap tw=120
set linebreak
set foldmethod=indent
set filetype=cpp 
set autoindent
set relativenumber
set incsearch
set autowrite
set nocompatible
set wim=longest,list
set vb t_vb=
set t_Co=256
set completeopt=preview
set cursorcolumn
map == mqHmwgg=G`wzt`q<cr>
set smartindent
set history=5000
set number
set cursorline
set clipboard=unnamedplus
set tabstop=4 softtabstop=4 expandtab shiftwidth=4
set foldlevel=99

colo deus 
let g:indentLine_enabled = 1
let g:IndentLinesToggle = 1
let g:indentLine_color_term = 256
let g:indentLine_color_tty_light = 4 " (default: 4)
let g:indentLine_color_dark = 2 " (default: 2)
map <M-t> !gcc *.cpp -lGL -lGLU -lglut -lm; ./a.out
" map  <ck> i :IndentLinesToggle <cr>


" map <M-n> :NERDTreeToggle<cr>
set encoding=utf8
set guifont=Anonymice\ Nerd\ Font\ Mono:h12
" set guifont=DroidSansMono\ Nerd\ Font\ Mono:h12

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='base16_twilight'
let g:airline#extensions#tabline#formatter = 'default'

filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map \\ <Plug>NERDCommenterInvert

let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint']}
"Alto Completo para vim 
let g:ale_completion_enabled = 1

" let g:ale_fixers = {
    " 'python': ['yapf'], 'c++': ['yapf'],
" }

"Abrir nova aba  
nmap <F10> :ALEFix<CR>

"Salvamentos de arquivos vim 
let g:ale_fix_on_save = 1

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
"
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
" Vim
"
let g:vim_json_conceal = 1
let g:markdown_syntax_conceal = 1
let g:indentLine_enabled  =  1
let g:indentLine_char = '┊'

let g:airline_symbols = { }
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = { }
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty ='⚡'
let c_no_curly_error=1
" set guifont=DroidSansMono\ Nerd\ Font\ Mono:12
set guifont=DroidSansMono\ Nerd\ Font:12

" "declaração da função
function! Executar(arq)
    :wall
    if &filetype == 'html'
        :exec '!google-chrome' a:arq
    elseif &filetype == 'python'
        :exec '!python3' a:arq
    elseif &filetype == 'cpp'
        :exec '!g++ -Wall -Wconversion -o /tmp/a.out' a:arq ';/tmp/a.out' 
    elseif &filetype == 'java'
        :exec '!javac -Wall -Wconversion -o /tmp/a.out' a:arq ';/tmp/a.out'
    endif
endfunction
noremap mk :w<cr>:!clear<cr>:call Executar(shellescape(@%, 1))<CR>

function ReplaceAll()
    let a = expand("<cword>")
    set hlsearch
    let b = input('Substituir "' . a . '" por: ')
    if !empty(a)
        execute '%s/' . a . '/' . b . '/g'
        execute '%s/' . b . '//ng
        set nohlsearch
endfunction
nnoremap <silent>! <c-b> : call ReplaceAll()<cr>
nnoremap <c-b> :call ReplaceAll()<cr>

autocmd Filetype text setl spell spl=pt
autocmd BufNewFile,BufRead *.txt setl spell spl=pt
nnoremap <space> za
nnoremap pdf <esc> :hardcopy
nnoremap <c-l> :wall!<cr>:bn<cr>n
nnoremap <c-h> :wall!<cr>:bp<cr>n
"Bloqueio das teclas
map <F1> <nop>
map <left> <nop>
map <right> <nop>
map <Up> <nop>
map <Down> <nop>
" gcc *.cpp -lGL -lGLU -lglut -lm; ./a.out' 
nnoremap <S-k> :wall<cr>:! clear;g++ *.cpp -lglut -lGLU -lGL -lm && ./a.out<cr>; 
function Terminal()
    " verificar se há buffer bash aberto:
    let meuterminal = bufname('bash')
    if meuterminal == ''
        below term ++rows=10
    else
        let bnr = bufnr(meuterminal)
        exec ':bwipe! ' bnr
    endif
endfunction
map <c-t> :call Terminal()<cr>

au TerminalOpen * if &buftype == 'terminal' | setlocal nobuflisted | endif

"Mapeamento java
"
imap { {<cr>}<esc>O
let g:ycm_language_server =
            \ [{
            \   'name': 'ccls',
            \   'cmdline': [ 'ccls' ],
            \   'filetypes': ['java', 'c', 'cpp', 'cuda', 'objc', 'objcpp' ],
            \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
            \ }]

" source ~/.vim/coc.nvimrc

"Desativar destaque de função (afeta arquivos C e C++)
let g:cpp_function_highlight = 1 

"Ativar destaque de atributos C++11
let g:cpp_attributes_highlight = 1

" Realçar variáveis membro de struct/class (afeta arquivos C e C++)
let g:cpp_member_highlight = 1

"Coloque todas as palavras-chave padrão C e C++ no grupo de destaque do Vim 'Statement'
" (afeta arquivos C e C++)
let g:cpp_simple_highlight = 1
