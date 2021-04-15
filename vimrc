set nocompatible
filetype off

""""""""""""" vundle """"""""""""""""""""""""""""""""""""""""""
" Install vundle : 
" git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim

" Install plugins: 
" 1. Open vim
" 2. esc
" 3. :PluginInstall
" Remove plugins:
" 1. delete the plugin line below
" 2. open vim
" 3. esc
" 4. :PluginClean
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Taglist.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'jeaye/color_coded'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable' }

call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""YouCompleteMe"""""""""""""""""""""""""""
" Install YouCompleteMe in Linux x64
" Reference 
"       https://github.com/ycm-core/YouCompleteMe#linux-64-bit
" 1. download YouCompleteMe using PluginInstall
" 2. cd ~/.vim/bundle/YouCompleteMe
" 3. git checkout legacy-c++11 if you env (g++) no support c++
" 4. git submodule update --init --recursive
" 5. python install.py
" 6. set the variable below for YouCompleteMe to run with vim
set pythonthreedll=/data/xxx/anaconda3/lib/libpython3.8.so.1.0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""color_coded""""""""""""""""""""""""""""""
" Install color_coded
" 1. Install color_coded plugin using Vundle
" 2. Make sure your vim is build with lua
"    vim --version | grep lua ----> +lua
"    Otherwise you have to recompile vim 
"    Ref: https://gist.github.com/leolord/bb51bdee3f199c2a6cfe2d57a42a2c26
"    1. # Remove previous installations
"       sudo apt-get remove vim vim-runtime vim-tiny vim-common
"    2. # Install dependencies
"       sudo apt-get install libncurses5-dev python-dev liblua5.3-dev lua5.3
"       python3-dev
"    3. # Fix liblua paths
"       sudo ln -s /usr/include/lua5.3 /usr/include/lua
"       sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so
"       /usr/local/lib/liblua.so
"    4. # Clone vim sources
"       cd ~ && git clone https://github.com/vim/vim.git && cd vim
"    5. # configure with lua
"       ./configure \
"         --enable-luainterp \
"         --enable-python3interp \
"         --enable-pythoninterp \
"         --with-python3-command=python3.8 \
"         --with-python3-config-dir=/data/xxx/anaconda3/lib/python3.8/config-3.8m-x86_64-linux-gnu/ \
"         --enable-cscope \
"         --disable-netbeans \
"         --enable0terminal \
"         --disable-xsmp \
"         --enable-fontset \
"         --enable-multibyte \
"         --enable-fail-if-missing \
"         --prefix=/data/xxx/anaconda3/
"    6. # make and install
"       make -j16 && sudo make install

" 3. build color_coded
"    1. cd ~/.vim/bundle/color_coded
"    2. mkdir build && cd build
"    3. cmake ..
"    4. make && make install # Compiling with GCC is preferred, ironically
"    # Clang works on OS X, but has mixed success on Linux and the BSDs
"
"    # Cleanup afterward; frees several hundred megabytes
"    5. make clean && make clean_clang

set backspace=indent,eol,start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""YCM-Generator"""""""""""""""""""""""""""
" This is a script which generates a list of compiler flags 
" from a project with an arbitrary build system. It can be used to:
"   - generate a .ycm_extra_conf.py file for use with YouCompleteMe
"   - generate a .color_coded file for use with color_coded
"
" Usage:
"     Run ./config_gen.py PROJECT_DIRECTORY, where PROJECT_DIRECTORY 
"     is the root directory of your project's build system 
"     (i.e. the one containing the root Makefile, etc.)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""plugin managment tool: pathogen"""""""""""""""""""
" execute pathogen#infect()
" filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""indent""""""""""""""""""""""""""""""""""
"c indent style 
"set autoindent
"set cindent

"indent width
" show existing tab with 4 spaces width, still a tab
set tabstop=4
" sets the number of columns for a tab.
set softtabstop=4

"expand tab to space
set expandtab
" when indenting with '>'(type new tab), use 4 spaces width
set shiftwidth=4

" for C-like  programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c,cpp,java set formatoptions+=ro
autocmd FileType c set omnifunc=ccomplete#Complete

" two space indentation for some files
autocmd FileType vim,lua,nginx,html,css set shiftwidth=2 softtabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" ensure normal tabs in assembly files
" and set to NASM syntax highlighting
autocmd FileType asm set shiftwidth=4 softtabstop=0 syntax=nasm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""normal config""""""""""""""
"set fileformats=unix

" coloring
set t_Co=256
" fix background color erase, https://sunaku.github.io/vim-256color-bce.html 
set t_ut=
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

"systax highlight
syntax on
"colorscheme murphy

set hlsearch

"align style
set cino=g0,:0

"show line number
set number

"let line buffer to save over 50 lines for copy and parse
set viminfo='1000,<500
"""""""""""""""""""""""""""""""""""""""


"""""""""""""""""Taglist config""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth=35
let Tlist_Use_Left_Window=1
let Tlist_Use_Right_Window=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_Auto_Update=1
let Tlist_Process_File_Always=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"search tags file
set tags=tags;
"set autochdir



"""""""""""""""""""cscope"""""""""""""""""""""""""""""""
"which cscope
set csprg=/usr/bin/cscope

"cs add /home/mingo/Work/JM18.6/lencod/cscope.out

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=1

    "************************************************************************************
    " Search from current directory to root to get the database"
    " expand()        see    :help filename-modifiers
    " fnamemodify     see    :help fnamemodify
    " cs add VAL      see    http://vim.1045645.n5.nabble.com/how-to-use-string-variable-for-quot-cs-add-quot-command-td1193913.html
    "************************************************************************************
    let SearchingPath=expand("%:p:h")
    let LoopCount=10

    while SearchingPath!="/" && LoopCount!=0
        let CSCOPE_DATABASE=SearchingPath . "/cscope.out"
        
        if filereadable(CSCOPE_DATABASE)
            "cs add VARIABLE has to use the form below
            exe "cs add " . CSCOPE_DATABASE
            "echom "cs add " . CSCOPE_DATABASE
            break
        endif
        
        let SearchingPath=fnamemodify(SearchingPath , ":h")
        let LoopCount=LoopCount-1
        "echom $LoopCount
    endwhile

    " add any cscope database in current directory
    "if filereadable("cscope.out")
    "    cs add cscope.out  
    "elseif filereadable("../cscope.out")
    "    cs add ../cscope.out
    "elseif filereadable("../../cscope.out")
    "    cs add ../../cscope.out
    " else add the database pointed to by environment variable 
    "elseif $CSCOPE_DB != ""
    "    cs add $CSCOPE_DB
    "endif

    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-

    " show msg when any other cscope db added
    set cscopeverbose
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-_>g :cs find g <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-_>c :cs find c <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-_>t :cs find t <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-_>e :cs find e <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-_>f :cs find f <C-R>=expand("<cfile>" )<CR><CR>  
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>" )<CR>$<CR>  
nmap <C-_>d :cs find d <C-R>=expand("<cword>" )<CR><CR> 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


