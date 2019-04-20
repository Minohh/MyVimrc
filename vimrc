"""""""""""""plugin managment tool: pathogen"""""""""""""""""""
execute pathogen#infect()
filetype plugin indent on
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


