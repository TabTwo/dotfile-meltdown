" Die Escape-Taste auf die CAPSLOCK-Taste legen:
" $ xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'


" In Vim die gerade bearbeitete Configurationsdatei einlesen
" :source %

" General settings
set nocompatible
set encoding=utf-8
filetype off
let mapleader = ","
set number
set hidden
set mouse=a
set t_Co=256
syntax enable
filetype plugin indent on
colorscheme fu

" Special stuff I use once a year
"set list "Show spechal characters


" Vundle settings
" :BundleList, :BundleInstall(!), :BundleSeach(!), :BundleClean(!)
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'minibufexplorerpp'
Bundle 'DirDiff.vim'

" Information bars
set laststatus=2
set directory=~/.vim/tmp/swp
set backupdir=~/.vim/tmp/swp
set wildmode=longest,list,full
set wildmenu
set showtabline=1
let g:PowerLine_symbols = 'unicode'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = "~/.vim/tmp"


" Printing
set printoptions=paper:A4,syntax:y,number:n

" Working with code
set showmatch
set showmode
set showcmd

set autoindent
set smartindent

set shiftwidth=2
set formatoptions+=croq
set tabstop=2
set expandtab
set linebreak

" Search
set hlsearch
set incsearch
set wrapscan
set ignorecase

set scrolljump=0
set scrolloff=3
set laststatus=2
set backspace=2

" Special filetypes need special settings
autocmd FileType text setl textwidth=80 formatoptions+=tna nocindent nosmartindent
autocmd BufEnter README* setl textwidth=80 formatoptions+=tna nocindent nosmartindent
autocmd BufEnter *.rules setl syntax=concat
autocmd BufEnter *.{c,cpp,h} setl cindent

" gvim and other graphical stuff
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Monospace\ 9

" Color stuff. Some marker, cursorline, crap, todos, whitespace and other
" special words will be highlighted.

" XXX: This may causes some performance issues. :)
"highlight clear CursorLine
"highlight CursorLine ctermbg=233
"set cursorline

highlight author ctermbg=black ctermfg=blue
highlight needLineBreak ctermbg=gray
highlight eolWhitespace ctermbg=red
match eolWhitespace /[  |\t]\+$/
match needLineBreak /.\%>80v/
match author /\(@[aA]uth\?or: \?\)\@<=[^ ].\+/

" Mark spaces
highlight ExtraWhitespace ctermbg=darkRed guibg=darkRed
match ExtraWhitespace /\s\+\%#\@<!$/

" Templates
function! LoadTemplate()
  silent! 0r ~/.vim/skel/template.%:e
  syn match Todo "%\u\+%" containedIn=ALL
endfunction
autocmd! BufNewFile * call LoadTemplate()


" Language Stuff
let g:languagetool_jar=$HOME.'/.vim/vendor/LanguageTool-1.5/LanguageTool.jar'
map <F8> :LanguageToolCheck<CR>
set clipboard=unnamed

" Thesaurus
set thesaurus=~/.vim/vendor/thesaurus_de.txt
"set thesaurus+=~/.vim/vendor/thesaurus_en.txt

" Translation
let g:trv_dictionary='~/.vim/vendor/de-en.txt'

" Spellchecking
" TODO: Refactor this
let g:myLang = 1
let g:myLangList = [ "Off", "German", "English" ]
function! ChangeSpellLang()
  if g:myLang == 0 | set nospell | endif
  if g:myLang == 1 | setlocal spell spelllang=de_de | endif
  if g:myLang == 2 | setlocal spell spelllang=en_us | endif
  echo "language:" g:myLangList[g:myLang]
  let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
map <F7> :call ChangeSpellLang()<CR>

set complete=.,w,b,u,t,i,kspell
hi SpellBad ctermbg=52 ctermfg=9
set spellsuggest=8

" Count the words
" http://www.vim.org/scripts/script.php?script_id=1191
map <leader>c :WC<CR>


" Keyboard remappings
inoremap jj <ESC>
" CAPSLOCK Key also maps to <ESC>
map ,, <C-^>

" Bars and stuff
map <F5> :Tlist<CR>
imap <F5> <ESC>:Tlist<CR>i
map <F4> :NERDTreeToggle<CR>
imap <F4> <ESC>:NERDTreeToggle<CR>i

" Windows
map + <C-W>+<C-W>+<C-W>+
map - <C-W>-<C-W>-<C-W>-

" Buffers
map <M-n> :bn!<CR>
imap <M-n> <ESC>:bn!<CR>i
map <M-p> :bp!<CR>
imap <M-p> <ESC>:bp!<CR>i
map <M-c> :bd!<CR>
imap <M-c> <ESC>:bd!<CR>i

" MiniBufExplorer Plugin
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

map <leader>x :!chmod +x %<cr>
map <leader>r :!./%<cr>

nnoremap <silent> <M-b> :FufBuffer<CR>
nnoremap <silent> <M-f> :FufFile<CR>
nnoremap <silent> <M-g> :FufDir<CR>

