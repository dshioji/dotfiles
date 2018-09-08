
""todo
"split with vimproc dependency

"set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"syntax
filetype plugin indent on
"syntax on is at the end of file
set nowrap

"auto insert asterisk on comments
filetype plugin on
set formatoptions+=ro


" turn syntax highlighting on
set t_Co=256

" allows you to deal with multiple unsaved buffers
set hidden

" backspace
set backspace=indent,eol,start


"highlit search
set hlsearch

"search increment
set incsearch


"undofile for files
"set undofile

set noswapfile


"disable comapat
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120

" colorscheme wombat256
" turn line numbers on
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"


""change status color in insert mode
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta guibg=Red



"switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"credit https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
"up and down reserved for snippet variable transfers
"map <C-j> <C-W>j
"map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanced keyboard mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null




"
"//always regexp on find
"　in all modes
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" ESC two times to exit highlighting
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"j j : insert mode to  normal mode
inoremap jj <Esc>
cnoremap jj <Esc> 

" in normal mode F2 will save the file
nnoremap <F2> :w<CR>

" in insert mode F2 will exit insert, save, enters insert again
inoremap <F2> <ESC>:w<CR>i

" execute shell file after save
"inoremap <F3> <ESC>:w<CR>:!bash % <CR>
"nnoremap <F3> :w<CR>:!bash % <CR>

inoremap <F3> <ESC>:w<CR>:!gcc -o a %;./a<CR>
nnoremap <F3> <ESC>:w<CR>:!gcc -o a %;./a<CR>

" switch between header/source with F4
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
inoremap <F4> <Esc>:w<CR>:!node %<CR>
nnoremap <F4> <Esc>:w<CR>:!node %<CR>
"map <F4> :w !node %<CR>

" recreate tags file with F5
" map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" insert date
"map <F5> :pu=strftime('%Y/%m/%d %H:%M:%S')>

inoremap <F5> <Esc>:w<CR>:!go run %<CR>
nnoremap <F5> <Esc>:w<CR>:!go run %<CR>




" create doxygen comment
map <F6> :Dox<CR>

"typescript compile and run
inoremap <F6> <Esc>:w<CR>:!npm run ts<CR>
nnoremap <F6> <Esc>:w<CR>:!npm run ts<CR>


"nnoremap <F5> <Esc>:w<CR>:!tsc %; node %:r.js<CR>
" build using makeprg with <F7>
map <F7> :make<CR>

" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

" use command line to compile c file
"map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>



" goto definition with F12
map <F12> <C-]>

nnoremap <C-y> mzyyp`z


" in diff mode we use the spell check keys for merging
if &diff

  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else

  " spell settings
  :setlocal spell spelllang=en

  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif


"Functions
" test function to add message to top and return message
function! AddHelloToTop()
    normal HOhello there^[A vim user ^[O
    s/hello there/hi/
    return "we added a message"

endfunction


"tab to autocomplete

"function! <SID>InsertTabWrapper(direction)
"  let idx = col('.') - 1
"  let str = getline('.')
"  if a:direction > 0 && idx >= 2 && str[idx - 1] == ' '
"        \&& str[idx - 2] =~? '[a-z]'
"    if &softtabstop && idx % &softtabstop == 0
"      return "\<BS>\<Tab>\<Tab>"
"    else
"      return "\<BS>\<Tab>"
"    endif
"  elseif idx == 0 || str[idx - 1] !~? '[a-z]'
"    return "\<Tab>"
"  elseif a:direction > 0
"    return "\<C-p>"
"  else
"    return "\<C-n>"
"  endif
"endfunction
"

function! TestFunc()
    normal ihellojava<esc>
    normal ohello mono
    normal ohello baa
    return "we added a mesage"

endfunction


""new maps----

"only in insertmode
"inoremap <silent> <Tab> <C-r>=<SID>InsertTabWrapper(1)<cr>
"inoremap <silent> <S-Tab> <C-r>=<SID>InsertTabWrapper(-1)<cr>

"map tab transfer
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>

"source vimrc
nnoremap sov :so ~/.vimrc <CR>
nnoremap ev :tabe ~/.vimrc <CR>

"inoremap <s-tab> <c-p>

"abbrevs
inoreabbrev teh the
inoreabbrev fn function

cnoreabbrev Wq wq
cnoreabbrev W w
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

"set leader to space
let mapleader = "\<Space>"



"Plugins
"pathogen plugin manager
"execute pathogen#infect()
"set nocp
" set rtp+=/path/to/rtp/that/included/pathogen/vim " if needed
"call pathogen#infect()
"filetype plugin indent on



"NeoBundle installs if it does not exist -------
set nocompatible
if has('vim_starting')
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

augroup MyAutoCmd
  autocmd!
augroup END

runtime! config/*.vim

filetype plugin indent on

autocmd MyAutoCmd FileType * setlocal formatoptions-=ro 

if(!empty(neobundle#get_not_installed_bundle_names()))
  echomsg 'Not installed bundles: '
    \ string(neobundle#get_not_installed_bundle_names())
  if confirm('Install bundles now?', "yes\nNo", 2) == 1
    NeoBundleInstall
    source ~/.vimrc
  endif
end


"--------------------

"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'


""ultisnips----------------
" Track the engine.
NeoBundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
NeoBundle 'honza/vim-snippets'


nnoremap <leader>snip :UltiSnipsEdit<CR>
"UltiSnips dirs
let g:UltiSnipsSnippetsDir="~/.vim/bundle/UltiSnips/"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/UltiSnips']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""end ultisnips----------------


"use PCRE for regexp
"NeoBundle 'othree/eregex.vim'

" for git
NeoBundle 'tpope/vim-fugitive'

" toggle comments
NeoBundle 'tomtom/tcomment_vim'

" change quotes etc.
NeoBundle 'tpope/vim-surround'

" less syntax color
"NeoBundle 'KohPoll/vim-less'


" colorize indents
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'junegunn/vim-easy-align'


NeoBundle 'terryma/vim-multiple-cursors'

"vim proc ----------
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

" tree view
NeoBundle 'Shougo/unite.vim'

" tree view
" depend on unite.vim
"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'Shougo/unite-outline'

"end vimproc ----------

call neobundle#end()


"
set sessionoptions-=options

"PCRE------
"let g:eregex_default_enable = 1
"nnoremap <leader>/ :call eregex#toggle()<CR>
"nnoremap <leader>? :%S/

"for deleteing space affter abbrev
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

"perldo
"abbreviate only in command mode
"deletes end space with Eatchar function 
:ca pd perldo s/<c-r>=Eatchar('\s')<cr>

"end PCRE-------

"paste mode always
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif


" Using the mouse on a terminal.
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632') " I couldn't use has('mouse_sgr') :-(
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif



"set paste mapping
"toggle
nnoremap <Space>p :set paste!<CR>
"nnoremap <Space>np :set nopaste<CR>



"unite vim-------

nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>

" file lists
nnoremap <silent>  [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" register lists
nnoremap <silent>  [unite]r :<C-u>Unite -buffer-name=register register<CR>
" most recently used list
nnoremap <silent>  [unite]m :<C-u>Unite file_mru<CR>
" most used list 
nnoremap <silent>  [unite]u :<C-u>Unite buffer file_mru<CR>

"unite -outline
nnoremap <silent>  [unite]o :<C-u>Unite outline<CR>


" all
nnoremap <silent>  [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" open with  windows split horizontally
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" open with  windows split vertically 
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" end with pressing esc 2 times
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q



" start with insert mode 
let g:unite_enable_start_insert = 1

" case insensitive
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep search
nnoremap <silent>  [unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" grep word on cursor
nnoremap <silent>  [unite]cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" execute same grep again 
nnoremap <silent>  [unite]r  :<C-u>UniteResume search-buffer<CR>


" using ag for grep in unite.vim ---
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"end using ag in unite vim-------

"unite :start ignore files in gitignore ----
"credit
"http://qiita.com/naoty_k/items/0f30a226621025897390
" ignore .gitignore files and .git directory
function! s:unite_gitignore_source()
  let sources = []
  if filereadable('./.gitignore')
    for file in readfile('./.gitignore')
      " do not use comment lines and empty lines
      if file !~ "^#\\|^\s\*$"
        call add(sources, file)
      endif
    endfor
  endif
  if isdirectory('./.git')
    call add(sources, '.git')
  endif
  let pattern = escape(join(sources, '|'), './|')
  call unite#custom#source('file_rec', 'ignore_pattern', pattern)
  call unite#custom#source('grep', 'ignore_pattern', pattern)
endfunction
call s:unite_gitignore_source()

"end unite :start ignore files in gitignore ----



""vim filer------------

"use vimfile for default explorer instead of netrw
let g:vimfiler_as_default_explorer = 1

"credit to 
"http://www.karakaram.com/vimfiler

" show tree on default withou focus

"autocmd VimEnter * execute 'VimFiler -split -simple -winwidth=45 -no-quit -no-focus'

" auto load vimfiler on vim load
"autocmd VimEnter * VimFiler -split -simple -winwidth=35 -no-quit -no-focus

nnoremap <leader>e :VimFilerExplore -split -winwidth=45 -find -no-quit -no-focus<Cr>
" F2 to show tree
" nnoremap <F2> :VimFiler -split -simple -winwidth=35 -no-quit<Cr>


"" http://hrsh7th.hatenablog.com/entry/20120229/1330525683
" v: split vertically、s:split horizontally
" changed function name from my_vimfiler_settings to My_vimfiler_settings.
"nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call My_vimfiler_settings()

function! My_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }                     
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)




"end vim filer ------------


"turn off spellcheck
set nospell


syntax on
