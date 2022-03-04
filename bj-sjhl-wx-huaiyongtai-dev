set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

Plugin 'junegunn/vim-easy-align'        "格式化对齐
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'Gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" 包含的前后段的数量
let g:limelight_paragraph_span = 1
" Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" Goyo配置
"let g:goyo_width = 86
"let g:goyo_height = 90%
"let g:goyo_linenr = 0
"进入goyo模式后自动触发limelight，退出则关闭
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

Plugin 'vim-syntastic/syntastic'
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php']
"" 设置错误符号
"let g:syntastic_error_symbol='✗'
"" 设置警告符号
"let g:syntastic_warning_symbol='⚠'
"" 是否在打开文件时检查
"let g:syntastic_check_on_open=0
"" 是否在保存文件后检查
let g:syntastic_check_on_wq=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" PHP语法检测
"Plugin 'joonty/vim-phpqa' " https://github.com/joonty/vim-phpqa
"let g:phpqa_messdetector_autorun = 0
"let g:phpqa_codesniffer_autorun = 0
"let g:phpqa_codecoverage_autorun = 1

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


" ==========================================================================================
set updatetime=500

" 高亮当前行
set cursorline

" 高亮行尾空格并移除
match Todo /\s\+$/
" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripWhite()
" fun! <SID>StripWhite()
"     %s/[ \t]\+$//ge
"     %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1))/8)!ge
" endfun
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 色阶
set t_Co=256

" 语法高亮
syntax on

" 自动缩进
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set noexpandtab / expandtab
set expandtab
%retab!

set number
set showmatch

"文件后缀 重新识别
au BufNewFile,BufRead *.php.* set filetype=php
au BufNewFile,BufRead *.conf  set filetype=php
au BufNewFile,BufRead *.conf.*  set filetype=php

"根据文件类型设置缩进格式
"au FileType html,python,vim,javascript setl shiftwidth=2
"au FileType html,python,vim,javascript setl tabstop=2
"au FileType java,php setl shiftwidth=4
"au FileType java,php setl tabstop=4
