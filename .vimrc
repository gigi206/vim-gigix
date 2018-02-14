"""""""""""""
" vim-GigiX "
"""""""""""""
" Author : Ghislain LE MEUR
" https://github.com/gigi206/vim-gigix

if !empty($VimPlugin)
    let g:MyPluginPath = fnamemodify(resolve(expand($VimPlugin)), ":p") . '/bundle'
endif

if !exists('g:MyPluginPath') || !isdirectory(g:MyPluginPath)
    let g:MyPluginPath = fnamemodify(resolve(expand($MYVIMRC)), ":p:h") . '/.vim/bundle'

    if !isdirectory(g:MyPluginPath)
        let g:MyPluginPath = fnamemodify(expand('~/.vim/bundle'), ":p")
    endif

    if !isdirectory(g:MyPluginPath)
        echo 'Directory .vim/bundle not found. Start "vim -u NONE" to solve the problem !'
        :qall
    endif
endif

let $PATH .= ':' . fnamemodify(g:MyPluginPath, ':h') . '/bin'

if &compatible
  set nocompatible               " Be iMproved
endif

let mapleader = ','

" Required:
exe 'set runtimepath+=' . g:MyPluginPath . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(g:MyPluginPath)
    let g:dein#types#git#clone_depth = 1
    call dein#begin(g:MyPluginPath)

    " Let dein manage dein
    call dein#add('Shougo/dein.vim')

    " Other plugins
    call dein#add('morhetz/gruvbox')
    call dein#add('lifepillar/vim-solarized8')
    call dein#add('mmozuras/vim-cursor')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('nathanaelkane/vim-indent-guides')
    "call dein#add( 'Yggdroot/indentLine')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('kshenoy/vim-signature')
    call dein#add('mhinz/vim-startify')
    call dein#add('terryma/vim-multiple-cursors', {'on_map' : ['<C-n>']})
    call dein#add('powerline/fonts', {'lazy' : 1, 'build' : './install.sh'})
    call dein#add('vim-scripts/matchit.zip', {'lazy' : 1, 'on_map' : ['%']})
    call dein#add('junegunn/vim-easy-align', {'lazy' : 1, 'on_map' : ['<Plug>(EasyAlign)']})
    call dein#add('easymotion/vim-easymotion', {'lazy' : 1, 'on_map' : ['<Plug>(easymotion-bd-w)','<Leader><Leader>s']})
    call dein#add('tpope/vim-surround', {'lazy' : 1, 'on_map' : ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>CSurround', '<Plug>Ysurround', '<Plug>YSurround', '<Plug>VSurround', '<Plug>VgSurround', '<Plug>Isurround', 'ISurround']})
    call dein#add('tpope/vim-repeat', {'lazy' : 1, 'on_map' : ['.']})
    call dein#add('gcmt/wildfire.vim', {'lazy' : 1, 'on_map' : ['<CR>']})
    call dein#add('scrooloose/nerdcommenter', {'lazy' : 1, 'on_map' : ['<Leader>cc', '<leader>cn', '<leader>c<space>', '<leader>cm', '<leader>ci', '<leader>cs', '<leader>cy', '<leader>c$', '<leader>cA', '<leader>ca', '<leader>cl', '<leader>cb', '<leader>cu']})
    call dein#add('scrooloose/syntastic', {'lazy' : 1, 'on_ft': ['python', 'ruby', 'perl', 'php', 'sh', 'vim', 'c', 'cpp', 'css', 'dockerfile', 'html', 'xhtml', 'javascript', 'json', 'markdown','yaml', 'xml', 'zsh']})
    call dein#add('scrooloose/nerdtree', {'lazy' : 1, 'on_cmd' : ['NERDTreeToggle','NERDTreeFind','NERDTree']})
    call dein#add('ctrlpvim/ctrlp.vim', {'lazy' : 1, 'on_map' : ['<C-p>']})
    call dein#add('luochen1990/rainbow', {'lazy' : 1, 'on_ft': ['xml', 'xhtml', 'html', 'vim', 'php']})
    call dein#add('vim-scripts/HTML-AutoCloseTag', {'lazy' : 1, 'on_ft': ['html']})

    if executable('git')
        call dein#add('mhinz/vim-signify')
        call dein#add('tpope/vim-fugitive')
    endif

    if has('python') && executable('python')
        call dein#add('sjl/gundo.vim', {'lazy' : 1, 'on_cmd' : ['GundoToggle']})
    endif

    if executable('ctags-exuberant')
        call dein#add('majutsushi/tagbar', {'lazy' : 1, 'on_cmd' : ['TagbarToggle']})
    endif

    call dein#add('SirVer/ultisnips', {'lazy' : 0})
    call dein#add('honza/vim-snippets', {'lazy' : 0})

    if has('python3') && executable('python3')
        call dein#add('Valloric/YouCompleteMe', {'lazy' : 1, 'build' : 'YCM_CORES=1 python3 install.py', 'on_map' : ['<F2>'], 'timeout' : 600})
    elseif has('python') && executable('python')
        call dein#add('Valloric/YouCompleteMe', {'lazy' : 1, 'build' : 'YCM_CORES=1 python install.py', 'on_map' : ['<F2>'], 'timeout' : 600})
    endif

    " Use local bundles config if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }

    " Required:
    call dein#end()
    call dein#save_state()
    "call dein#recache_runtimepath()
endif

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck
"NeoBundleCheckUpdate
"NeoBundleDisable
if dein#check_install()
  call dein#install()
endif

set nobackup
set history=1000     " Store lasts history
"set undofile         " Persistent undo
"set undodir=~/.vim/undo     " Persistent undo directory
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
set undolevels=1000         " Maximum number of changes that can be undone
"set nohlsearch       " Disable highlight for search
set visualbell       " Disable terminal blink
set t_vb=            " Disable terminal blink
set noerrorbells     " Disable terminal <BIP>
set lazyredraw       " Help cursorline refresh
set ttyfast          " Help for performance
set encoding=utf-8
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set hidden                  " Allow buffer switching without saving
"set autowrite              " Automatically write a file when leaving a modified buffer
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set shell=/bin/sh

scriptencoding utf-8
"setglobal fileencoding=utf-8
syntax on

" Key mapping
"nmap <silent> <Leader>/ :exec ":nohlsearch" ? "nohlsearch" : "set invhlsearch"<CR>
nmap <silent> <Leader>/ :set invhlsearch<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <C-d> :bd!<CR>
nnoremap <F9> :set wrap!<CR>
nnoremap <F10> :set cursorline!<CR>
nnoremap <Leader><Leader>l :set cursorline!<CR> " For compatibility with some terminals
nnoremap <F11> :set number!<CR>
nnoremap <Leader><Leader>n :set number!<CR> " For compatibility with some terminals
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,ruby setlocal foldmethod=syntax
"autocmd Syntax python setlocal foldmethod=indent
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,ruby,python normal zR
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

if has('termguicolors') && (&term == 'screen-256color' || &term == 'tmux-256color' || &term == 'xterm-256color')
    set termguicolors

    if exists('$TMUX')
        "TMUX compatibility
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
else
    set t_Co=256
endif

" vim-startify {
    if isdirectory(g:MyPluginPath . "/repos/github.com/mhinz/vim-startify")
        let g:startify_custom_header = [
            \ ' ██╗   ██╗██╗███╗   ███╗       ██████╗ ██╗ ██████╗ ██╗██╗  ██╗',
            \ ' ██║   ██║██║████╗ ████║      ██╔════╝ ██║██╔════╝ ██║╚██╗██╔╝',
            \ ' ██║   ██║██║██╔████╔██║█████╗██║  ███╗██║██║  ███╗██║ ╚███╔╝ ',
            \ ' ╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██║   ██║██║██║   ██║██║ ██╔██╗ ',
            \ '  ╚████╔╝ ██║██║ ╚═╝ ██║      ╚██████╔╝██║╚██████╔╝██║██╔╝ ██╗',
            \ '   ╚═══╝  ╚═╝╚═╝     ╚═╝       ╚═════╝ ╚═╝ ╚═════╝ ╚═╝╚═╝  ╚═╝',
            \ ]
        let g:startify_custom_footer = ['', 'Coded by Ghislain LE MEUR']
    endif
" }

" vim-solarized8 {
    if isdirectory(g:MyPluginPath . "/repos/github.com/lifepillar/vim-solarized8")
        if &term == 'tmux-256color' || &term == 'xterm-256color'
            let g:solarized_term_italics=1
        else
            let g:solarized_term_italics=0
        endif

        "let g:solarized_termcolors=256
        let g:solarized_termtrans=0
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        let g:solarized_diffmode="normal"
        "let g:solarized_use16 = 1
        colorscheme solarized8
        "set background=dark         " Assume a dark background
        "set background=light        " Assume a light background
        if exists('g:colors_name') && g:colors_name == 'solarized8'
            nnoremap <silent> <F5> :call ToggleBackground()<CR>
        endif
        "set cursorcolumn                " Highlight current column
        set cursorline                  " Highlight current line
        "highlight clear LineNr          " Current line number row will have same background color in relative mode
        "highlight clear CursorLineNr    " Remove highlight color from current line number
        "if &background == 'dark'
        "    highlight CursorLineNr term=bold ctermfg=244 gui=bold guifg=Yellow
        "endif
    endif
" }

" gruvbox {
    if isdirectory(g:MyPluginPath . "/repos/github.com/morhetz/gruvbox")
        if &term == 'tmux-256color' || &term == 'xterm-256color'
            let g:gruvbox_italic=1
        else
            let g:gruvbox_italic=0
        endif

        let g:gruvbox_contrast_light='hard'
    endif
"}

" vim-airline {
    if isdirectory(g:MyPluginPath . "/repos/github.com/vim-airline/vim-airline")
        " Workaround for vim-airline with lazyredraw
        autocmd VimEnter * redrawstatus!

        if has('statusline')
            set laststatus=2
        endif

        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#branch#enabled = 1

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
    endif
" }

" vim-easymotion {
    if isdirectory(g:MyPluginPath . "/repos/github.com/easymotion/vim-easymotion")
        nmap <Leader><Leader>w <Plug>(easymotion-bd-w)
    endif
" }

" matchit.zip {
    if isdirectory(g:MyPluginPath . "/repos/github.com/vim-scripts/matchit.zip")
        let b:match_ignorecase = 1
    endif
" }

" vim-surround {
    if isdirectory(g:MyPluginPath . "/repos/github.com/tpope/vim-surround")
        nmap ds  <Plug>Dsurround
        nmap cs  <Plug>Csurround
        nmap cS  <Plug>CSurround
        nmap ys  <Plug>Ysurround
        nmap yS  <Plug>YSurround
        nmap yss <Plug>Yssurround
        nmap ySs <Plug>YSsurround
        nmap ySS <Plug>YSsurround
        xmap S   <Plug>VSurround
        xmap gS  <Plug>VgSurround
        imap <C-S> <Plug>Isurround
        imap <C-G>s <Plug>Isurround
        imap <C-G>S <Plug>ISurround
    endif
" }

" Wildfire {
    if isdirectory(g:MyPluginPath . "/repos/github.com/gcmt/wildfire.vim")
        let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
            \ "html,xml" : ["at", "it"],
        \ }
    endif
" }

" vim-easy-align {
    if isdirectory(g:MyPluginPath . "/repos/github.com/junegunn/vim-easy-align")
        nmap <Leader>a <Plug>(EasyAlign)
        xmap <Leader>a <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
        xmap ga <Plug>(EasyAlign)
    endif
" }

" Gundo {
    if isdirectory(g:MyPluginPath . "/repos/github.com/sjl/gundo.vim")
        nnoremap <Leader>u :GundoToggle<CR>
    endif
" }

" Rainbow {
    if isdirectory(g:MyPluginPath . "/repos/github.com/luochen1990/rainbow")
        let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
        nnoremap <Leader><Leader>r :RainbowToggle<CR>
    endif
" }

" vim-fugitive {
    if isdirectory(g:MyPluginPath . "/repos/github.com/tpope/vim-fugitive")
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
    endif
" }

" vim-signify {
    if isdirectory(g:MyPluginPath . "/repos/github.com/mhinz/vim-signify")
       "highlight SignColumn ctermfg=Black ctermbg=Black guifg=Black guibg=Black
       "highlight SignColumn ctermfg=239 ctermbg=235 guifg=239 guibg=235
       "highlight SignifySignAdd    cterm=bold ctermbg=22 ctermfg=22 guifg=22 guibg=255
       "highlight SignifySignDelete cterm=bold ctermbg=52 ctermfg=255 guifg=52 guibg=255
       "highlight SignifySignChange cterm=bold ctermbg=186 ctermfg=0 guifg=186 guibg=0
       let g:signify_update_on_bufenter = 1
       let g:signify_update_on_focusgained = 1
       let g:signify_sign_show_text = 1
       let g:signify_line_highlight = 0
       nnoremap <silent> <Leader>gg :SignifyToggle<CR>
       nnoremap <silent> <Leader>gh :SignifyToggleHighlight<CR>
       " hunk jumping
       nmap <leader>gj <plug>(signify-next-hunk)
       nmap <leader>gk <plug>(signify-prev-hunk)
    endif
" }

" vim-indent_guides {
    if isdirectory(g:MyPluginPath . "/repos/github.com/nathanaelkane/vim-indent-guides")
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    endif
" }

" NerdTree {
    if isdirectory(g:MyPluginPath . "/repos/github.com/scrooloose/nerdtree")
        "map <C-e> <plug>NERDTreeTabsToggle<CR>
        "map <leader>e :NERDTreeFind<CR>
        map <leader>e :NERDTreeToggle<CR>
        "nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    endif
" }

" YouCompleteMe {
    if isdirectory(g:MyPluginPath . "/repos/github.com/Valloric/YouCompleteMe")
        "let g:ycm_use_ultisnips_completer = 0
        let g:ycm_key_invoke_completion = '<C-Space>'

        let g:acp_enableAtStartup = 0

        " enable completion from tags
        let g:ycm_collect_identifiers_from_tags_files = 1

        " remap Ultisnips for compatibility for YCM
        "let g:UltiSnipsExpandTrigger = '<C-j>'
        "let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        "let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

        " Set ultisnips triggers
        let g:SuperTabDefaultCompletionType    = '<C-n>'
        let g:SuperTabCrMapping                = 0
        let g:UltiSnipsExpandTrigger           = '<tab>'
        let g:UltiSnipsJumpForwardTrigger      = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
        let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

        " Enable omni completion.
        "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        "autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        " Disable the neosnippet preview candidate window
        " When enabled, there can be too much visual noise
        " especially when splits are used.
        set completeopt-=preview
        "set completeopt+=preview
    endif
" }

" TagBar {
    if isdirectory(g:MyPluginPath . "/repos/github.com/majutsushi/tagbar")
        nnoremap <silent> <F3> :TagbarToggle<CR>
        "nnoremap <silent> <leader>tt :TagbarToggle<CR>
    endif
" }

" syntastic {
    if isdirectory(g:MyPluginPath . "/repos/github.com/scrooloose/syntastic")
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 1
    endif
" }

" HTML-AutoCloseTag {
    if isdirectory(g:MyPluginPath . "/repos/github.com/vim-scripts/HTML-AutoCloseTag")
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    endif
    "
" }

" auto-pairs {
    if isdirectory(g:MyPluginPath . "/repos/github.com/jiangmiao/auto-pairs")
        let g:AutoPairsShortcutToggle = '<Leader>ap'
    endif
" }

" Functions {
    function! DarkBackground()
        colorscheme solarized8
        let g:airline_theme='luna'
        set bg=dark
        hi IndentGuidesOdd ctermfg=242 ctermbg=0 guifg=grey15 guibg=grey30
        hi IndentGuidesEven ctermfg=0 ctermbg=242 guifg=grey30 guibg=grey15
    endfunction

    function! LightBackground()
        colorscheme gruvbox
        let g:airline_theme='lucius'
        set bg=light
        highlight link EasyMotionTarget ErrorMsg
        highlight link EasyMotionTarget2First Search
        highlight link EasyMotionTarget2Second Search
        "highlight EasyMotionTarget ctermbg=none term=bold ctermfg=1
        "highlight EasyMotionTarget2First ctermbg=none ctermfg=129
        "highlight EasyMotionTarget2Second ctermbg=none ctermfg=129
        hi IndentGuidesOdd ctermfg=229 ctermbg=250 guifg=bg guibg=#d5c4a1
        hi IndentGuidesEven ctermfg=229 ctermbg=223 guifg=bg guibg=#ebdbb2
    endfunction

    function! ToggleBackground()
        if !isdirectory(expand("~/.vim/config"))
            call mkdir(expand("~/.vim/config"), "p")
        endif

        if &bg == 'dark'
            call writefile(['light'], expand("~/.vim/config/solarized"))
            call LightBackground()
        else
            call writefile(['dark'], expand("~/.vim/config/solarized"))
            call DarkBackground()
        endif
    endfunction
    " }

    if exists('g:colors_name') && g:colors_name == 'solarized8'
        if filereadable(expand("~/.vim/config/solarized")) && readfile(expand("~/.vim/config/solarized"))[0] == 'light'
            call LightBackground()
        else
            call DarkBackground()
        endif
    endif
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

