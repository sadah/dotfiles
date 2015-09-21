" 色付けする
syntax on

"新しい行のインデントを現在行と同じにする
set autoindent

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vimbackup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

"スワップファイル用のディレクトリ
set directory=$HOME/.vimbackup

" Vi互換をオフ
set nocompatible

" タブの画面上でddの幅
" set tabstop=2

" タブをスペースに展開
set expandtab

" タブ文字の代わりに挿入されるホワイトスペースの量
set softtabstop=2

" 自動インデントの際に使う1レベル分のインデント量
set shiftwidth=2

" 行末で折り返さない
set nowrap

" タブ文字、行末など不可視文字を表示する
"set list

" 行番号を表示
"set number

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 検索をファイルの先頭へループしない
set nowrapscan

" ハイライト検索
set hlsearch

" ステータスライン
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set laststatus=2

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'vim-ruby/vim-ruby'
  " Bundle "rails.vim"
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'svn-diff.vim'
  " Bundle 'minibufexpl.vim'
  NeoBundle 'buftabs'
  NeoBundle 'desert.vim'
  NeoBundle 'Zenburn'
  NeoBundle 'ZenCoding.vim'
  call neobundle#end()
endif


let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1

filetype plugin indent on

"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

"Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" バッファをタブに開く
":let g:miniBufExplMapWindowNavVim = 1
":let g:miniBufExplMapWindowNavArrows = 1
":let g:miniBufExplMapCTabSwitchBuffs = 1

"バッファタブにパスを省略してファイル名のみ表示する(buftabs.vim)
" let g:buftabs_only_basename=1
"バッファタブをステータスライン内に表示する
" let g:buftabs_in_statusline=1

" Edit file by tabedit.
let g:vimfiler_edit_action = 'tabopen'

"vimdiffの色を変える
hi DiffAdd    ctermfg=black
hi DiffChange ctermfg=black
hi DiffDelete ctermfg=black
hi DiffText   ctermfg=black

" netrwは常にtree view
let g:netrw_liststyle = 3
