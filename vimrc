" *****************************************************************
" *****************************************************************
" My .vimrc file
" *****************************************************************
" *****************************************************************


" *****************************************************************
" from https://github.com/VundleVim/Vundle.vim
" *****************************************************************
set nocompatible " to use Vim, not just vi

filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" useful plugins
Plugin 'L9'
Plugin 'Aster89/vim-snippets' " I added gdscript.snippet, and I'm waiting for the approval
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'powerline/fonts'
"Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'ron89/thesaurus_query.vim'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'sjl/gundo.vim'
Plugin 'quabug/vim-gdscript' 
Plugin 'vim-scripts/ScrollColors' 
Plugin 'k-takata/matchit.vim' 

call vundle#end()  " required
filetype plugin indent on " required
"To ignore plugin indent changes, instead use:
"filetype plugin on

"Brief help
":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line
" *****************************************************************
" from https://github.com/VundleVim/Vundle.vim
" *****************************************************************


" *****************************************************************
" some settings related to plugins
" *****************************************************************
let g:gundo_prefer_python3=1
let g:gundo_preview_bottom=1
let g:gundo_width=30
let g:gundo_close_on_revert=1
" ^[OD is the left arrow
nnoremap OD :GundoToggle<CR>

let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=1

let g:snips_author = "Enrico Maria De Angelis"
let g:snips_email = "enricomaria.deangelis@unina.it"
let g:snips_github = "https://github.com/Aster89"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F8>"
let g:UltiSnipsJumpForwardTrigger="<F8>"
let g:UltiSnipsJumpBackwardTrigger="<F7>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" *****************************************************************
" some settings related to plugins
" *****************************************************************


" *****************************************************************
" from http://vim-latex.sourceforge.net/
" *****************************************************************
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" to compile directly in pdflatex with vim-latex when \ll is pressed
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -shell-escape -src-specials -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat='pdf'

" to see the preview with the pdfviewer okular when \ls is pressed
let g:Tex_ViewRule_pdf = 'okular --unique'
set grepprg=grep\ -nH\ $*
" *****************************************************************
" from http://vim-latex.sourceforge.net/
" *****************************************************************


" *****************************************************************
" other options
" *****************************************************************
colo pablo " set the colorscheme

set noea    " avoid resizing when a new window is opened or closed
set nu      " show line numbers
set cul     " Highlight the screen line of the cursor with CursorLine
"set cuc    " Highlight the screen column of the cursor with CursorColumn

set is      " highlights the matched pattern while typing a search command
set nohls   " disable searched pattern highlight (the highlight is kept while typing the search pattern
set sc      " show incomplete commands, such as y2, in the bottom line (under the status bar)
set nows    " don't wrap around the end of the file when searching

set ic      " ignore case
set wic     " incore case when completing file names and directories

set nobk    " this three options...
set nowb    " ... are useful to navigate from buffer to buffer...
set hid     " ... without having to write the buffer each time

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab smartindent autoindent

"let g:tq_openoffice_en_file="/usr/share/mythes/th_it_IT_v2"
set dictionary+=/usr/share/dict/words " set the dictionary

"hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=NONE guifg=NONE
hi search ctermbg=white ctermfg=black
hi comment ctermfg=darkgrey

set list lcs=tab:\|\ " to show tabs as vertical lines
" *****************************************************************
" other options
" *****************************************************************


" *****************************************************************
" some mappings
" *****************************************************************
" ò, à, ù and è are in the same relative positions
" as left, down, right and up arrows, so I map them
" to increase/decreas horizontally and vertically the windows
map ù :vert res +1 
map ò :vert res -1
map è :res +1
map à :res -1

"nnoremap \ :OnlineThesaurusCurrentWord<CR>
nnoremap \ :ThesaurusQueryReplaceCurrentWord<CR>
" *****************************************************************
" some mappings
" *****************************************************************


" *****************************************************************
" compile and run
" *****************************************************************
" Ctrl-C to write all, clear the shell, and compile
map  :wall:!clear:!make
" Ctrl-\ to run a program with mpirun with a given number of processes
nnoremap  :<C-u>call MpirnArg(v:count)<cr>
function! MpirnArg(n)
    exe "!mpirun -np ".a:n." codice"
endfunction
" *****************************************************************
" compile and run
" *****************************************************************


" *****************************************************************
" custom caps lock turned off when extiting insert mode
" *****************************************************************
" The following is aimed to use CTRL-^ (that is CTRL-MAIUSC-ì) in place of
" capslock. The advantage is the last line of code, which consists in
" turning off the fictitious capslock  when exiting the insert mode
" (solution found on vim.wikia.com/wiki/insert-mode_only_Caps_Lock).
"
" Execyte 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
" When the character c is a capital letter (c)
for c in range(char2nr('A'), char2nr('Z'))
    " map lower case letters (i.e. c+32) to upper case letters (c)
    execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
    " map upper case letters (i.e. c) to lower case letters (c+32)
    " I don't like it
"   execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0
" *****************************************************************
" custom caps lock turned off when extiting insert mode
" *****************************************************************


" *****************************************************************
" I don't remember
" *****************************************************************
" quanto segue serve per ...
" Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" *****************************************************************
" I don't remember
" *****************************************************************


" *****************************************************************
" file type detection
" *****************************************************************
au BufNewFile,BufRead *.tikz set filetype=tex
" what follows serves to detect the filetype of the current buffer
" even if no extensions has been set (.sh, .c, ...) [cf. Learning 
" the vi and Vim editors, page 205 e following]
augroup newFileDetection
    au CursorMovedI * call CheckFileType()
augroup end
function CheckFileType()
    if exists("b:countCheck") == 0
        let b:countCheck = 0
    endif
    let b:countCheck += 1
    if &filetype == "" && b:countCheck > 20 && b:countCheck < 200
        filetype detect
    elseif b:countCheck >= 200 || &filetype != ""
        au! newFileDetection
    endif
endfunction
" *****************************************************************
" file type detection
" *****************************************************************


" *****************************************************************
" lightline plugin, from https://github.com/itchyny/lightline.vim
" *****************************************************************
" settings for lightline plugin to represent a very nice status bar
set noshowmode " to not show the staus, which is already in the lightline status line
set laststatus=2 " to show the lightline staus line also with one window
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" *****************************************************************
" lightline plugin, from https://github.com/itchyny/lightline.vim
" *****************************************************************


" *****************************************************************
" old stuff after this
" *****************************************************************
" autocompletamento - successivo
"imap <Tab> <C-N>
" autocompletamento - precedente
"imap <S-Tab> <C-P>
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
" alternative found on the web:
"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
"function! Tab_Or_Complete()
"  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"    return "\<C-N>"
"  else
"    return "\<Tab>"
"  endif
"endfunction
"inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"
"function! UnTab_Or_CompleteBackward()
"  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"    return "\<C-P>"
"  else
"    return "\<C-d>"
"  endif
"endfunction
"inoremap <S-Tab> <C-R>=UnTab_Or_CompleteBackward()<CR>
