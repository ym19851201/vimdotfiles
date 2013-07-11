"Powerline設定ファイル読み込み
source /Users/miyazaki/vimdotfiles/.vimrc.statusline
"色設定読み込み
source ~/vimdotfiles/.vimrc.color
"unite.vim設定読み込み
source ~/vimdotfiles/.vimrc.unite

" クリップボード共通か設定
set clipboard=unnamed,autoselect
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

" イコール設定
"inoremap = <Space>=<Space>
"inoremap == <Space>==<Space>
"inoremap  += <Space>+=<Space>
"inoremap  -= <Space>-=<Space>
"inoremap >= <Space>>=<Space>
"inoremap <= <Space><=<Space>
"inoremap => <Space>=><Space>
"inoremap , ,<Space>
"inoremap  + <Space>+<Space>
"inoremap  - <Space>-<Space>

"タイル間移動
"nmap gf <C-w>w
"nmap gb <C-w>W
nmap <Tab> <C-w>w
nmap <S-Tab> <C-w>W
"タイルサイズ変更
nmap <S-Right> <C-w>5>
nmap <S-Left> <C-w>5<
nmap <S-Up> <C-w>5+
nmap <S-Down> <C-w>5-

"カーソル表示
set cursorline
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

" カーソルキー問題解消
" if !has('gui_running')
"     set notimeout
"     set ttimeout
"     set timeoutlen=100
" endif

" imap OB <Down>
" imap OD <Left>
" imap OC <Right>
" imap OA <Up>
" 
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

set nocompatible
" vundle設定してみる
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'neocomplcache'
Bundle 'vim-powerline'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-quickrun'
"Bundle 'neocomplcache-snippets_complete'
Bundle 'ZenCoding.vim'
Bundle 'vimfiler'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'h1mesuke/unite-outline'
Bundle 'EnhCommentify.vim'
Bundle 'rails.vim'
Bundle 'open-browser.vim'
Bundle 'thinca/vim-ref'
Bundle 'mbbill/undotree'
Bundle 'YankRing.vim'
filetype plugin indent on

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

" 辞書補完
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'java' : '/Users/miyazaki/.vim/j2se14.dict',
	\ 'python' : '/Users/miyazaki/.vim/complete2dict.dict',
	\ 'ruby' : '/Users/miyazaki/.vim/ruby.dict'
	\ }
"let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_ignore_case= 1
" スニペット補完
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><Tab> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C - n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory = '~/.vim/bundle/neosnippet/snippets'

" crontab保存用設定
autocmd BufRead /tmp/crontab.* :set nobackup nowritebackup

"open-browser.vim設定
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"webdictサイト設定
let g:ref_source_webdict_sites = {
\ 'je':{
\    'url': 'http://dictionary.infoseek.ne.jp/jeword/%s', 
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

" undotrees設定
nmap ,u :UndotreeToggle<CR>
let g:undotree_SetFocus_WhenToggle=1
let g:undotree_SplitLocation='topleft'
let g:undotree_SplitWidth=35
let g:undotree_diffAutoOpen=1
let g:undotree_diffpanelHeight=25
let g:undotree_RelativeTimestamp=1
let g:undotree_TreeNodeShape='*'
let g:undotree_HighlightChangeText=1
let g:undotree_HighlightSyntax="UnderLined"

" YankRing.vim設定
nmap ,y :YRShow<CR>
