"neobundle乗り換え
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git
  call neobundle#rc(expand('~/.vim/.bundle'))
endif

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'EnhCommentify.vim'
NeoBundle 'rails.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'alpaca-tc/alpaca_powertabline'

filetype plugin on
filetype indent on

let g:airline_powerline_fonts=1

"色設定読み込み
source ~/vimdotfiles/.vimrc.color
"unite.vim設定読み込み
source ~/vimdotfiles/.vimrc.unite
"neocomplcache設定読み込み
source ~/vimdotfiles/.vimrc.neocomplcache

" クリップボード共通か設定
"set clipboard=unnamed,autoselect
"ヤンクやりやすくなる？
vnoremap <silent> <C-p> "0p<CR>"

" 行数セット
set number
".vimrc読み込み
nmap ,s :source ~/.vimrc<CR>
nmap .rc :vsp<CR>:e ~/.vimrc<CR>

" カレントディレクトリコマンド
nmap ,cd :cd %:h<CR>

" カッコ設定
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" タブ設定
set tabstop=2
set shiftwidth=2
set expandtab

"タイル間移動
nmap <Tab> <C-w>w
nmap <S-Tab> <C-w>W
"タイルサイズ変更
nmap <S-Right> <C-w>5>
nmap <S-Left> <C-w>5<
nmap <S-Up> <C-w>5+
nmap <S-Down> <C-w>5-

"カーソル表示
set cursorline
let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" crontab保存用設定
autocmd BufRead /tmp/crontab.* :set nobackup nowritebackup

"open-browser.vim設定
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"webdictサイト設定
let g:ref_source_webdict_sites = {
\ 'je': {
\    'url': 'http://translate.google.co.jp/%s', 
\  }, 
\  'ej': {
\    'url': 'http://dictionary.infoseek.ne.jp/ejword/%s', 
\  }, 
\  'wiki': {
\    'url': 'http://ja.wikipedia.org/wiki/%s', 
\  }, 
\}
" ref.vims設定
nmap ,rd :<C-u>Ref webdict<Space>
nmap ,rw :<C-u>Ref webdict wiki<Space>
let g:ref_source_webdict_sites.default = 'ej'
let g:ref_source_webdict_linenumber = 35
let g:ref_source_webdict_encoding = 'UTF-8'

" YankRing.vim設定
nmap ,y :YRShow<CR>

nnoremap t :tabnew<CR>
