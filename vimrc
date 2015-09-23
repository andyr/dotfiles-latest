let mapleader = ","

source ~/.vim/vundle.vim

syntax enable               "syntax highlighting

set ffs=unix,dos            "line endings
set ff=unix                 "line endings

set bg=dark                 "for dark background consoles

set tabstop=4               "tab = 4 spaces
set softtabstop=4           "tab = 4 spaces
set shiftwidth=4            "tab = 4 spaces
set expandtab               "turn tabs in spaces


" a - terse messages (like [+] instead of [Modified]
" t - truncate file names
" I - no intro message when starting vim fileless
" T - truncate long messages to avoid having to hit a key
set shortmess=atTI

" display the number of (characters|lines) in visual mode, also cur command
" set showcmd

" current mode in status line
" set showmode

" show fold column, fold by markers
set foldcolumn=2
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
let python_syntax_folding=1

" indicate when a line is wrapped by prefixing wrapped line with '> '
set showbreak=>\ 

" always show tab line
set showtabline=2

" highlight position of cursor
" set cursorline
" set cursorcolumn

set nocompatible
syntax on
filetype on
filetype plugin on

" fast terminal for smoother redrawing
set ttyfast

set omnifunc=syntaxcomplete#Complete
set autoindent
set cindent
set showmatch
set matchtime=1

" t: autowrap text using textwidth
" l: long lines are not broken in insert mode
" c: autowrap comments using textwidth, inserting leader
" r: insert comment leader after <CR>
" o: insert comment leader after o or O
set formatoptions-=t
set formatoptions+=lcro
set textwidth=80

" context while scrolling
set scrolloff=3

" arrow keys, bs, space wrap to next/prev line
set whichwrap=b,s,<,>,[,]

" backspace over anything
set backspace=indent,eol,start

" case insensitive search if all lowercase
set ignorecase smartcase

" turn off bells, change to screen flash
set visualbell

" show our whitespace
set listchars=tab:\|\ ,trail:.
"set list

" complete to longest match, then list possibilities
set wildmode=longest,list

" turn off swap files
set noswapfile

" options for diff mode
set diffopt=filler
set diffopt+=context:4
set diffopt+=iwhite
set diffopt+=vertical

" keep a lot of history
set history=100

" keep lots of stuff
set viminfo+=:100
set viminfo+=/100

" don't duplicate an existing open buffer
set switchbuf=useopen

" {{{ filetype dependent
autocmd BufNewFile,BufRead *.html setlocal commentstring=<!--%s-->
" ruby commenstring
autocmd FileType ruby setlocal commentstring=#%s
" make help navigation easier
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
"}}}

"php syntax options {{{
let php_sql_query = 1  "for SQL syntax highlighting inside strings
let php_htmlInStrings = 1  "for HTML syntax highlighting inside strings
"php_baselib = 1  "for highlighting baselib functions
"php_asp_tags = 1  "for highlighting ASP-style short tags
"php_parent_error_close = 1  "for highlighting parent error ] or )
"php_parent_error_open = 1  "for skipping an php end tag, if there exists an open ( or [ without a closing one
"php_oldStyle = 1  "for using old colorstyle
"php_noShortTags = 1  "don't sync <? ?> as php
let php_folding = 1  "for folding classes and functions
" }}}
"netrw options {{{
let g:netrw_sort_sequence = '[\/]$,\.php,\.phtml,*,\.info$,\.swp$,\.bak$,\~$'
"}}}
"{{{taglist options
" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant;p:property'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 60
" close tlist when a selection is made
let Tlist_Close_On_Select = 1
" show the prototype
let Tlist_Display_Prototype = 1
" show tags only for current buffer
let Tlist_Show_One_File = 1
"}}}
"{{{html options
let html_use_css = 1
"}}}
au BufNewFile,BufRead *.less set filetype=less
" mappings
" {{{ general
let mapleader = "\\"
" easier move screen up/down
nmap <C-j> <C-e>
nmap <C-k> <C-y>
nmap <space> za
" turns off highlighting
nmap <Leader>/ :nohl<CR>
" search for highlighted text
vmap // y/<C-R>"<CR>
" keep block highlighted when indenting
vmap >> >gv
vmap << <gv
" fix a block of XML; inserts newlines, indents properly, folds by indent
nmap <Leader>fx :setlocal filetype=xml<CR>:%s/></>\r</g<CR>:1,$!xmllint --format -<CR>:setlocal foldmethod=indent<CR>
" comment/uncomment highlighted block
vmap <Leader>cc :s!^!//!<CR>
vmap <Leader>cu :s!^//!!<CR>
" open local projects list file
nmap <Leader>l :70vsplit ~/Dropbox/projects.list<CR>
" fix syntax highlighting
nmap <Leader>ss :syntax sync fromstart<CR>
" toggle the tag list
nmap <Leader>tl :TlistToggle<CR>
" toggle gundo
nmap <Leader>gu :GundoToggle<CR>
" make arrow keys useful
" use them to swap between split windows
nmap <left> <C-W>h
nmap <right> <C-W>l
nmap <up> <C-W>k
nmap <down> <C-W>j

"f keys {{{
nmap <F2> :call ToggleColumns()<CR>
imap <F2> <C-o>:call ToggleColumns()<CR>
nmap <F3> :Nload<CR>
" <F4>
set pastetoggle=<F5>
" <F6>
nmap <F7> :!updatedev.php %:p<CR>
nmap <F8> :call WriteTrace()<CR>
nmap <F9> \ph
" <F10>
" <F11> don't use; terminal full-screen
" <F12>

" Single Nerdtree instance on every tab
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>

"{{{ TAB MGMT
" Some useful bits for managing tabs.
" Also changes format of tab line.
" Commands and shortcuts:
" \oc - open dir of current file in new tab
" H - navigate to tab to the left
" L - navigate to tab to the right
" C-l - move current tab left
" C-h - move current tab right
" gf - changes default behavior from opening file under cursor in current window to opening in new tab
nmap <Leader>oc :tabe %:h<CR>

" quicker aliases for navigating tabs
nmap H gT
nmap L gt
" move tab left or right
nmap <C-l> :call MoveTab(0)<CR>
nmap <C-h> :call MoveTab(-2)<CR>

" gf should use new tab, not current buffer
map gf :tabe <cfile><CR>

"tab line
fun! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'.(i+1).''
		" the filename is made by MyTabLabel()
		let s .= '%{MyTabLabel(' . (i + 1) . ')}  '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'
	return s
endfunction

fun! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let fullname = bufname(buflist[winnr - 1])
	" show a/b/c/filename.ext
	"let fullname = substitute(fullname,"(\w){1}\w*/","\1/","g")
	" show filename.ext
	let fullname = substitute(fullname,".*/","","")
	if getbufvar(buflist[winnr - 1],"&mod")
		let modified = "+"
	else
		let modified = " "
	endif
	return modified.fullname
endfunction

" Use the above tabe naming scheme
set tabline=%!MyTabLine()

"tab moving
fun! MoveTab(n)
	let which = tabpagenr()
	let which = which + a:n
	exe "tabm ".which
endfunction
"}}}


set number
if exists("&relativenumber")
    set norelativenumber
endif

nnoremap / /\v
vnoremap / /\v
nnoremap Y y$
nnoremap Q gq
set ignorecase              "ignore case in searches
set smartcase
set gdefault
set hlsearch                "highlight search items"

set modeline                "read modeline from files"
set modelines=5             "look for modelines in first 5 lines"

set copyindent              "copy the previous indentation on autoindenting
set hidden                  "hide buffers instead of closing them

"" wrapping stuff
set wrap
set textwidth=0             "When wrapping is off, break lines at 78 chars
set formatoptions=qrn1

color jellybeans

if exists("&colorcolumn")
    set colorcolumn=80
    hi ColorColumn ctermbg=black guibg=grey10
    "match ErrorMsg '\%>80v.\+'
endif

set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc,*.class,.git,node_modules,lib-cov

"" TOhtml stuff
let html_use_css=1          "use css in HTML output
let use_xhtml=1             "use xhtml in HTML output

"" Folding
set foldmethod=indent       "fold based on identation 
set nofen                   "open all folds initially

set printoptions=paper:letter,number:y

"" some system specific commmands
if has("mac")
    iab  rtime   <ESC>:r!gdate -R<CR>i<BS><ESC>A
elseif has("unix")
    iab  rtime   <ESC>:r!date -R<CR>i<BS><ESC>A
endif

"" toggle margins
map ;L ;on-m
map ;off-m      :set textwidth=0\|map ;L ;on-m<CR>
map ;on-m       :set textwidth=78\|map ;L ;off-m<CR>

" Change <tab>s to spaces
map ;T :retab<CR>

nnoremap j gj
nnoremap k gk

" Visually select the text that was last edited/pasted
nmap gV `[v`]

"" F key toggles
map <F7>    :set relativenumber!<CR>
map <F8>    :set paste!<CR>
map <F9>    :set wrap!<CR>

map <F10>   :Tlist<CR>
map <F11>   :wa!<CR>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>
map <F12>   :wa!<CR>:make<CR>

let g:SuperTabDefaultCompletionType = "context"

set verbose=0

set list
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap . .`[

" GIT
" set laststatus=2
" set statusline=%<%f[%{GitBranch()}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %3*%{strlen(&ft)?&ft:'none'}%*\ %4*%{fugitive#statusline()}%*%h%m%r%=%-14.(%l,%c%V%)\ %P

" From https://gist.github.com/840731
set statusline=\ "
set statusline+=%-25.80f\ " file name minimum 25, maxiumum 80 (right justified)
set statusline+=%h "help file flag
set statusline+=%r "read only flag
set statusline+=%m "modified flag
set statusline+=%w "preview flag
set statusline+=\ "
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]\ "
set statusline+=%1*%{fugitive#statusline()}%*\ " Fugitive
"set statusline+=%5*%{Rvm#statusline()}%*\ " RVM
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* " Syntastic Syntax Checking
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" Don't count warnings as errors
" let g:syntastic_quiet_warnings=1
let g:syntastic_stl_format = '%E{[Err: %fe #%e]}'
let g:syntastic_go_checkers = ['go', 'govet']

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.json set filetype=json

if has("autocmd")
    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap

    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist

    " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
endif
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Removes trailing spaces
command! TrimWhiteSpace %s/\v\s+$//

" SaveasSamePath saves with new name to same path (all one line)
" via http://vim.1045645.n5.nabble.com/How-to-make-saveas-default-to-original-file-s-directory-td2827361.html
command! -nargs=1 SaveasSamePath exe "saveas " . expand("%:p:h") . "/" . expand("<args>")

if (&t_Co == 256 || &t_Co == 88) && !has('gui_running')
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  "runtime! bundle/guicolorscheme.vim/plugin/guicolorscheme.vim
  "GuiColorScheme twilight
endif

" ConqueTerm settings
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1

" Makes it easy to run a shells
" example: can do ":Node %" to run the current file
command! -nargs=* -complete=file Shell ConqueTermSplit <args>
command! -nargs=* -complete=file Zsh ConqueTermSplit zsh <args>
command! -nargs=* -complete=file Node ConqueTermSplit node <args>
command! -nargs=* -complete=file Python ConqueTermSplit python <args>

" use python json to Tidy a file
command! -range=% -nargs=* Json <line1>,<line2>!python -mjson.tool <args>

" Support xterm mouse
set mouse=a

" Support bracketed paste
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x/7053522#7053522
if &term =~ "xterm.*"
    let &t_ti = "\<Esc>[?2004h" . &t_ti
    let &t_te = "\<Esc>[?2004l" . &t_te

    function! XTermPasteBegin(ret)
      set pastetoggle=<Esc>[201~
      set paste
      return a:ret
    endfunction

    execute "set <f28>=\<Esc>[200~"
    execute "set <f29>=\<Esc>[201~"
    map <expr> <f28> XTermPasteBegin("i")
    imap <expr> <f28> XTermPasteBegin("")
    vmap <expr> <f28> XTermPasteBegin("c")
    cmap <f28> <nop>
    cmap <f29> <nop>
endif

" A motion for the current match.
" Lets you do "ci/" to change the current match
" via http://stackoverflow.com/a/8697727/544243
vnoremap <silent> i/ :<c-u>call SelectMatch()<cr>
onoremap <silent> i/ :call SelectMatch()<cr>
function! SelectMatch()
    if search(@/, 'bcW')
        norm! v
        call search(@/, 'ceW')
    else
        norm! gv
    endif
endfunction

" For vim-gitgutters
highlight clear SignColumn

if has("unix")
  set directory=~/.vim/swap
  set backupdir=~/.vim/backup
  set undodir=~/.vim/undo
  set undofile
endif

" For vim-airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_c='%{fnamemodify(getcwd(), ":t")} %f%m'
" let g:airline#extensions#tabline#enabled = 1

let g:gofmt_command = "goimports"

" vim-go
au FileType go nmap gd <Plug>(go-def)

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
