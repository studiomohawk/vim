".vimrc {
" " Maintained by: Yuya Saito
" http://css.studiomohawk.com
" https://github.com/studiomohawk/vim
" Contact me @ https://twitter.com/cssradar
" vimrc is not complete nor perfect, I've started using vim recently, so any
" suggestion is very welcomed and appriciated.
" }

" Environment {
  " This must be first, because it changes other options as a side effect.
  set nocompatible
  " Assume a dark background
  set background=dark
  " Manage plugins
  filetype off
  call pathogen#infect()
  call pathogen#helptags()
" }

" General Setting {
  " Automatically detect file types.
  filetype plugin indent on
  " syntax highlighting
  syntax on
  " Switch between buffers without saving
  set hidden
  " Default file types
  set ffs=unix,dos,mac
  set termencoding=utf-8
  set encoding=utf-8
  " Scroll faster
  set ttyfast
  " No beep
  set visualbell
  set noerrorbells
  " Set to auto read when a file is changed from the outside
  set autoread
  " No mode line
  set nomodeline
  " better unix / windows compatibility
  set viewoptions=folds,options,cursor,unix,slash
  " allow for cursor beyond last character
  set virtualedit=onemore
  " Use mouse
  set mouse=a
  " Enable mouse usage in visual mode
  set selectmode=key
  " allow backspacing over everything in insert mode
  set backspace=indent,eol,start
  " Enable code folding
  set foldenable
    " add a fold column
  set foldcolumn=2
  " detect triple-{ style fold markers
  set foldmethod=marker
  " which commands trigger auto-unfold
  set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
  " session settings
  set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
  " clipboard sharing
  set clipboard=unnamed
  " Don't jump to start of line when scrolling
  set nostartofline
  " MacVIM shift+arrow-keys behavior
  let macvim_hig_shift_movement = 1
  " Always switch to the current file dir
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
  " gf can open relative path
  autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/
  " change the terminal's title
  set title
  set listchars=tab:▸\ ,eol:¬,trail:.,precedes:<,extends:>
  " don't show invisible characters by default
  set list
  " paste mode / no auto indent
  set pastetoggle=<F2>
  " Search {
    " do incremental searching
    set incsearch
    " Highlight searching
    set hlsearch
    " case insensitive search
    set ignorecase
    set smartcase
    " defalut substitute global
    set gdefault
    "Set magic on, for regular expressions
    set magic
  " }

  " History {
  set history=1000
  set nobackup
  set nowb
  set noswapfile
  " }

  " Auto Reload Vimrc
  augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup END
  " }
" }

" UI {
  " Remove toolbar, left scrollbar and right scrollbar
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  " Show lines numbers
  set number
  " Always show tab
  set showtabline=2
  " show matching brackets/parenthesis
  set showmatch
  " Font
  " set guifont=M+1VM+IPAG\ circle:h14 linespace=2
  " set guifont=Monaco\ for\ Powerline:h13 linespace=1
  set gfn=Source_Code_Pro_for_Powerline:h14
  " set guifont=Ubuntu\ Mono\ Regular:h14 linespace=1
  " always switch to the current file directory
  autocmd BufEnter * cd %:p:h
  " Hide mouse when typing
  set mousehide
  " Status bar that is 2 rows high
  set cmdheight=2

  " Status line {
  if has('cmdline_info')
    " show the ruler
    " set ruler
    " set rulerformat=%30(<D-≈>%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    " set showcmd
  endif
  if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    " Filename
    set statusline=%<%f
    " Options
    set statusline+=%w%h%m%r
    " current dir
    set statusline+=\ [%{getcwd()}]
    " Git Hotness
    set statusline+=\ %{fugitive#statusline()}
    " Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " Show file format
    set statusline+=\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\\"}%k
    " filetype
    set statusline+=\ [%Y/%{&ff}]
    " ASCII / Hexadecimal value of char
    "set statusline+=\ [A=\%03.3b/H=\%02.2B]
     " Right aligne " underline the current line
  endif

  set cursorline
  " Color
  " colorscheme base16-default
  colorscheme solarized

  " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
  if &term == 'iterm' || &term == 'screen' || &term == 'term-256color'
    set t_Co=256
  endif
  " Set the title bar to something meaningful
  if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                                             " file name
    set titlestring+=%h%m%r%w                                        " flags
    set titlestring+=\ -\ %{v:progname}                              " program name
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
  endif
" }

" Formatting {
  " Tab {
    set smarttab
    set softtabstop=2
    set tabstop=2
    set shiftwidth=2
    set expandtab
    " use multiple of shiftwidth when indenting with '<' and '>'
    set shiftround
  " }
  " Indent {
    set smartindent
    set autoindent
  " }
  " Line wrap {
    set wrap
    set textwidth=79
    set formatoptions=qrn1
    set colorcolumn=85
  " }
" }

" Syntax highlight {
  au BufRead,BufNewFile *.styl set filetype=css
  au BufRead,BufNewFile *.styl set syntax=stylus
  au BufRead,BufNewFile *.scss set filetype=css
  au BufRead,BufNewFile *.scss set syntax=scss
  au BufRead,BufNewFile *.sass set filetype=css
  au BufRead,BufNewFile *.sass set syntax=sass
  au BufRead,BufNewFile *.less set filetype=css
  au BufRead,BufNewFile *.less set syntax=less
  au BufNewFile,BufReadPost *.json set filetype=json
" }

" Japanese input setting {
  silent! set keymap=japanese
  set noimd imi=0 ims=0
  au BufNewFile,BufRead * set noimd
  au FocusGained * set noimd
  inoremap <ESC> <ESC>:set noimd<CR>
  set fencs=utf-8,shift-jis,euc-jp,latin1
  set ambw=double
  highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
  au BufRead,BufNew * match JpSpace /　/
" }

" Conflict markers {
" highlight conflict markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" shortcut to jump to next conflict marker
  nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>
" }

" Completion {
  set wildmenu " More useful command-line completion
  set wildmode=list:longest,full
  set wildignore+=*.o,*.obj,.git,.hg,.svn,*.rbc,*.pyc
  " Onmi Compelation on
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType less set omnifunc=csscomplete#CompleteCSS
  autocmd FileType stylus set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  set completeopt=longest,menuone
" }

" Filetype specific handling {
" only do this part when compiled with support for autocommands
" }

" Key bindings {
  " Change mapleader '/' to ','
  let mapleader = ","
  let g:mapleader = ","
  " Jump to matching pairs easily, with Tab
  nnoremap <Tab> %
  vnoremap <Tab> %
  " Ack for the word under cursor
  "nnoremap <leader>a :Ack<Space>
  "nnoremap <leader>a :Ack<Space><c-r><c-W>
  " Use shift-H and shift-L for move to beginning/end
  nnoremap H 0
  nnoremap L $
  " Remap j and k to act as expected when used on long, wrapped, lines
  nnoremap j gj
  nnoremap k gk
  "Map escape key to jj -- much faster
  imap jj <esc>
  "Saves time; maps the spacebar to colon
  nmap <space> :
  " Arrow keys, in visual mode, act like hjkl
  map <down> j
  map <up> k
  map <left> h
  map <right> l
  " ,space to clear hllight on search
  nnoremap <leader><space> :noh<cr>
  " ,dt to remove trailing space
  nnoremap <leader>dt :%s/\s\+$//<cr>:let @/=''<CR>
  " ,dl to delete blank line
  nnoremap <leader>dl :g/^\s*$/d<cr>
  " Remove the Windows ^M - when the encodings gets messed up
  noremap <Leader>rm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
  "Bubble single lines (kicks butt) {
  "http://vimcasts.org/episodes/bubbling-text/
  nmap <C-Up> ddkP
  nmap <C-Down> ddp
  "Bubble multiple lines
  vmap <C-Up> xkP`[V`]
  vmap <C-Down> xp`[V`]
  " }

  " easier window navigation {
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l
  " }

  " keymap Firefox like tab move {
  " nmap <C-S-tab> :tabprevious<CR>
  " nmap <C-tab> :tabnext<CR>
  " map <C-S-tab> :tabprevious<CR>
  " map <C-tab> :tabnext<CR>
  " imap <C-S-tab> <Esc>:tabprevious<CR>i
  " imap <C-tab> <Esc>:tabnext<CR>i
  " nmap <C-t> :tabnew<CR>
  " imap <C-t> <Esc>:tabnew<CR>
  " }

  " Easier increment/decrement
  nnoremap + <C-a>
  nnoremap - <C-x>

  " H to start line, L to end line
  noremap H ^
  noremap L $

  " Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h

  " ss to split vv to vsplit
  nnoremap <silent> ss :split<CR>
  nnoremap <silent> vv :vsplit<CR>

  "bind command-] to indent
  nmap <D-]> >>
  vmap <D-]> >gv
  imap <D-]> <C-O>>>

  "bind command-[ to outdent
  nmap <D-[> <<
  vmap <D-[> <gv
  imap <D-[> <C-O><<

  " visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " Automatically indent after pasting, use p to use regular paste
  nnoremap <leader>p p
  nnoremap <leader>P P
  nnoremap p p'[v']=
  nnoremap P P'[v']=

  " Folding
  nnoremap <leader>f za
  vnoremap <leader>f za

  " Sane regex
  nnoremap / /\v
  vnoremap / /\v

  " Visually select the text that was last edited/pasted
  nmap gV `[v`]

  " Toggle show/hide invisible chars
  nnoremap <leader>i :set list!<cr>
  " Edit Vimrc file with leader ev
  nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
" }

  " Open md with marked
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

  " Open md with iawriter
  :nnoremap <leader>ia :silent !open -a iAWriter.app '%:p'<cr>

  " Copy full filepath
  :nnoremap <silent> <leader>fp :let @+=expand("%:p")<CR>

  " Copy Line num
  :nnoremap <silent> <leader>ln <Esc>:let @*=line(".")<CR>

  " Copy cwd
  :nnoremap <silent> <leader>cwd :let @+=expand("%:p:h")<CR>

  " choose font
  map <F3> <Esc>:set guifont=*<CR>

  " find todo
  noremap <Leader>ot :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>

" Plugins {

  " Powerline {
  let g:Powerline_symbols = 'fancy'
  " }

  " NERDTree  {
  " autocmd vimenter * if !argc() | NERDTree | endif
  " map <Leader>nt :NERDTreeToggle<CR>
  map <Leader>nt <plug>NERDTreeTabsToggle<CR>
  map <Leader>nf :NERDTreeFind<CR>
  let NERDTreeIgnore=['\~$', '\.DS_Store']
  let NERDTreeChDirMode=2
  "Show hidden files in NerdTree
  let NERDTreeShowHidden=1
  " Show the bookmarks table on startup
  let NERDTreeShowBookmarks=1
  " Make NerdTree Pretty
  let NERDChristmasTree=1
  " Close NerdTree after open
  let NERDTreeQuitOnOpen=0
  " Store the bookmarks file
  let NERDTreeBookmarksFile=expand("$HOME/.vim_local/.NERDTreeBookmarks")
  " Highlight the selected entry in the tree
  let NERDTreeHighlightCursorline=1
  " When switching into a tab, make sure that focus is on the file window
  let g:nerdtree_tabs_focus_on_files=1
  " }

  " supertab {
  "  let g:SuperTabDefaultCompletionType = "context"
  "  let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
  "  let g:SuperTabLongestEnhanced = 1

  hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
  hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
  hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
  " some convenient mappings
  inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
  inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
  inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
  " and make sure that it doesn't break supertab
  " let g:SuperTabCrMapping = 0
  " automatically open and close the popup menu / preview window
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set completeopt=menu,preview,longest
  " }

  " Qfreplace {
  nmap <leader>qr :Qfreplace<cr>
  " }

  " indent-guide {
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_space_guides = 1
  " }

  " zencoding {
    let g:user_zen_expandabbr_key = '<c-e>'
    let g:use_zen_complete_tag = 1
  " }

  " CtrlP }
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlPMixed'
  let g:ctrlp_working_path_mode = 'ra'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.svn/*,*/.git/*
  let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
  let g:ctrlp_user_command = 'find %s -type f'
  let g:ctrlp_open_new_file = 't'
  " }

  " Clam {
  nnoremap ! :Clam<space>
  vnoremap ! :ClamVisual<space>
  " }

  " Syntastic {
  let g:syntastic_enable_signs       = 1
  let g:syntastic_auto_loc_list      = 0
  let g:syntastic_auto_jump          = 0
  let g:syntastic_javascript_checker = 'jshint'
  let g:syntastic_csslint_options = "--ignore=adjoining-classes,compatible-vendor-prefixes,display-property-grouping,empty-rules,zero-units,box-model,outline-none"
  " let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['stylus'] }
  " }

  " buffergator {
  let g:buffergator_viewport_split_policy = "B"
  " }

  " Tabularize {
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
  " }

  " vim-pipe {
  "nnoremap <silent> <Leader>pi :call VimPipe()<CR>
  " }

" }

" Functions {

" Toggle the quickfix window {
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction
" }

" http://vim.wikia.com/wiki/List_lines_with_keyword_and_prompt_for_jump
" List occurrences of keyword under cursor, and
" jump to selected occurrence.
function! s:JumpOccurrence()
  let v:errmsg = ""
  exe "normal [I"
  if strlen(v:errmsg) == 0
    let nr = input("Which one: ")
    if nr =~ '\d\+'
      exe "normal! " . nr . "[\t"
    endif
  endif
endfunction

" List occurrences of keyword entered at prompt, and
" jump to selected occurrence.
function! s:JumpPrompt()
  let keyword = input("Keyword to find: ")
  if strlen(keyword) > 0
    let v:errmsg = ""
    exe "ilist! " . keyword
    if strlen(v:errmsg) == 0
      let nr = input("Which one: ")
      if nr =~ '\d\+'
        exe "ijump! " . nr . keyword
      endif
    endif
  endif
endfunction

nnoremap <Leader>j :call <SID>JumpOccurrence()<CR>
nnoremap <Leader>p :call <SID>JumpPrompt()<CR>

" }
