"""""""""""""
" vim-GigiX "
"""""""""""""
" Author : Ghislain LE MEUR
" https://github.com/gigi206/vim-gigix
" Git must be installed pour install or updated modulesA
" exuberant-ctags (+ cmake + g++ + python-dev => for compile) => if you wan to use youcompleteme (vim with +python os needed)
" If you use vim with putty, you must install compatible font like ~.vim/bundle/fonts/DejaVuSansMono/*ttf in Window/Apperance :
"   * Font Settings : font => 'DejaVu Sans Mono for powerline'
"   * font quality : ClearType

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

if &compatible
  set nocompatible               " Be iMproved
endif

let mapleader = ','

" Required:
"set runtimepath+=~/.vim/bundle/neobundle.vim/
exe 'set runtimepath+=' . g:MyPluginPath . '/neobundle.vim/'

" Required:
"call neobundle#begin(expand('~/.vim/bundle'))
call neobundle#begin(g:MyPluginPath)

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'mmozuras/vim-cursor'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-airline/vim-airline', {'depends' : 'vim-airline/vim-airline-themes'}
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'terryma/vim-multiple-cursors', {'autoload' : {'mappings' : ['<C-n>']}}
NeoBundleLazy 'powerline/fonts', {'build' : {'linux' : 'bash install.sh'}}
NeoBundleLazy 'vim-airline/vim-airline-themes'
NeoBundleLazy 'matchit.zip', {'autoload' : {'mappings' : ['%']}}
NeoBundleLazy 'junegunn/vim-easy-align', {'autoload' : {'mappings' : ['<Plug>(EasyAlign)']}}
NeoBundleLazy 'easymotion/vim-easymotion', {'autoload' : {'mappings' : ['<Plug>(easymotion-bd-w)','<Leader><Leader>s']}}
NeoBundleLazy 'tpope/vim-surround', {'autoload' : {'mappings' : ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>YSurround', '<Plug>VSurround', '<Plug>Isurround']}}
NeoBundleLazy 'tpope/vim-repeat', {'autoload' : {'mappings' : ['.']}}
NeoBundleLazy 'gcmt/wildfire.vim', {'autoload' : {'mappings' : ['<CR>']}}
NeoBundleLazy 'scrooloose/nerdcommenter', {'autoload' : {'mappings' : ['<Leader>cc', '<leader>cn', '<leader>c<space>', '<leader>cm', '<leader>ci', '<leader>cs', '<leader>cy', '<leader>c$', '<leader>cA', '<leader>ca', '<leader>cl', '<leader>cb', '<leader>cu']}}
NeoBundleLazy "scrooloose/syntastic", {'autoload' : {'filetypes': ['python', 'ruby', 'perl', 'php', 'sh', 'vim', 'c', 'cpp', 'css', 'dockerfile', 'html', 'xhtml', 'javascript', 'json', 'markdown','yaml', 'xml', 'zsh']}}
NeoBundleLazy 'scrooloose/nerdtree', {'autoload' : {'commands' : ['NERDTreeToggle','NERDTreeFind','NERDTree']}}
NeoBundleLazy 'tpope/vim-fugitive', {'external_commands' : ['git'], 'disabled' : (!executable('git')), 'autoload' : {'commands' : ['Gstatus', 'Gcommit', 'Gwrite', 'Gdiff', 'Gblame', 'Git', 'Ggrep']}, 'depends' : 'mhinz/vim-signify'}
NeoBundleLazy 'mhinz/vim-signify', {'autoload' : {'commands' : ['SignifyToggle']}}
NeoBundleLazy 'ctrlpvim/ctrlp.vim', {'autoload' : {'mappings' : ['<C-p>']}}
NeoBundleLazy 'luochen1990/rainbow', {'autoload' : {'filetypes': ['xml', 'xhtml', 'html', 'vim', 'php']}}
NeoBundleLazy 'vim-scripts/HTML-AutoCloseTag', {'autoload' : {'filetypes': ['html']}}
NeoBundleLazy 'sjl/gundo.vim', {'external_commands' : [ 'python' ], 'disabled' : (!has('python')), 'autoload' : {'commands' : ['GundoToggle']}}
NeoBundleLazy 'majutsushi/tagbar', {'external_commands' : ['ctags-exuberant'], 'autoload' : {'commands' : ['TagbarToggle']}}
NeoBundleLazy 'SirVer/ultisnips'
NeoBundleLazy 'honza/vim-snippets'
NeoBundleLazy 'Valloric/YouCompleteMe', {'build' : {'linux' : 'YCM_CORES=1 python install.py'}, 'external_commands' : ['ctags-exuberant'], 'disabled' : (!has('python')), 'autoload' : {'mappings' : ['<F2>']}, 'depends' : ['SirVer/ultisnips', 'honza/vim-snippets']}
"NeoBundleLazy 'godlygeek/tabular', {'autoload' : {'commands' : ['Tabularize']}}

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Use local bundles config if available {
    if filereadable(expand("~/.vimrc.bundles.local"))
        source ~/.vimrc.bundles.local
    endif
" }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"NeoBundleCheckUpdate
"NeoBundleDisable

set nobackup
set history=1000     " memoire de l'historique
set undolevels=1000  " nombre de retour arriere possible
"set nohlsearch       " desactive le surlignement lors des recherches
set visualbell       " desactive le <BIP>
set t_vb=            " desactive le clignotement de visualbell
set noerrorbells     " desactive le <BIP>
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
setglobal fileencoding=utf-8
syntax on

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Workaround for vim-airline with lazyredraw
autocmd VimEnter * redrawstatus!

" Key mapping
nmap <silent> <Leader>/ :exec ":nohlsearch" ? "nohlsearch" : "set invhlsearch"<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <C-d> :bd!<CR>
nnoremap <F9> :set wrap!<CR>
nnoremap <F10> :set cursorline!<CR>
nnoremap <F11> :set number!<CR>
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

if has('gui_running')
    " Gui here
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
endif


" vim-colors-solarized {
    if filereadable(g:MyPluginPath . "/vim-colors-solarized/colors/solarized.vim")
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        set background=dark         " Assume a dark background
        colorscheme solarized

        "set cursorcolumn                " Highlight current column
        set cursorline                  " Highlight current line
        "highlight clear SignColumn      " SignColumn should match background
        "highlight clear LineNr          " Current line number row will have same background color in relative mode
        "highlight clear CursorLineNr    " Remove highlight color from current line number
    endif
" }

" vim-airline {
    if isdirectory(g:MyPluginPath . "/vim-airline")
        if !exists('g:airline_theme')
            let g:airline_theme = 'luna'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif

    if has('statusline')
        set laststatus=2
    endif

        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1

        "let g:airline_left_sep = ''
        "let g:airline_left_alt_sep = ''
        "let g:airline_right_sep = ''
        "let g:airline_right_alt_sep = ''

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
          " unicode symbols
        "let g:airline_left_sep = '»'
        "let g:airline_left_sep = '▶'
        "let g:airline_right_sep = '«'
        "let g:airline_right_sep = '◀'
        "let g:airline_symbols.crypt = ''
        "let g:airline_symbols.linenr = '␊'
        "let g:airline_symbols.linenr = '␤'
        "let g:airline_symbols.linenr = '¶'
        "let g:airline_symbols.maxlinenr = '☰'
        "let g:airline_symbols.maxlinenr = ''
        "let g:airline_symbols.branch = '⎇'
        "let g:airline_symbols.paste = 'ρ'
        "let g:airline_symbols.paste = 'Þ'
        "let g:airline_symbols.paste = '∥'
        "let g:airline_symbols.spell = 'Ꞩ'
        "let g:airline_symbols.notexists = '∄'
        "let g:airline_symbols.whitespace = 'Ξ'

        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
    endif
" }

" vim-easymotion {
    if isdirectory(g:MyPluginPath . "/vim-easymotion")
        nmap <Leader><Leader>w <Plug>(easymotion-bd-w)
    endif
" }

" matchit.zip {
    if isdirectory(g:MyPluginPath . "/matchit.zip")
        let b:match_ignorecase = 1
    endif
" }

" vim-surround {
    if isdirectory(g:MyPluginPath . "/vim-surround")
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
    if isdirectory(g:MyPluginPath . "/wildfire.vim")
        let g:wildfire_objects = {
                    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
                    \ "html,xml" : ["at", "it"],
                    \ }
    endif
" }

" Tabularize {
"    if isdirectory(g:MyPluginPath . "/tabular")
"        nmap <silent> <Leader>a& :Tabularize /&<CR>
"        vmap <silent> <Leader>a& :Tabularize /&<CR>
"        nmap <silent> <Leader>a= :Tabularize /^[^=]*\zs=<CR>
"        vmap <silent> <Leader>a= :Tabularize /^[^=]*\zs=<CR>
"        nmap <silent> <Leader>a=> :Tabularize /=><CR>
"        vmap <silent> <Leader>a=> :Tabularize /=><CR>
"        nmap <silent> <Leader>a: :Tabularize /:<CR>
"        vmap <silent> <Leader>a: :Tabularize /:<CR>
"        nmap <silent> <Leader>a:: :Tabularize /:\zs<CR>
"        vmap <silent> <Leader>a:: :Tabularize /:\zs<CR>
"        nmap <silent> <Leader>a, :Tabularize /,<CR>
"        vmap <silent> <Leader>a, :Tabularize /,<CR>
"        nmap <silent> <Leader>a,, :Tabularize /,\zs<CR>
"        vmap <silent> <Leader>a,, :Tabularize /,\zs<CR>
"        nmap <silent> <Leader>a<Bar> :Tabularize /<Bar><CR>
"        vmap <silent> <Leader>a<Bar> :Tabularize /<Bar><CR>
"    endif
" }

" vim-easy-align {
    if isdirectory(g:MyPluginPath . "/vim-easy-align")
        nmap <Leader>a <Plug>(EasyAlign)
        xmap <Leader>a <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
        xmap ga <Plug>(EasyAlign)
    endif
" }

" Gundo {
    if isdirectory(g:MyPluginPath . "/gundo.vim")
        "nnoremap <F5> :GundoToggle<CR>
        nnoremap <Leader>u :GundoToggle<CR>
    endif
" }

" Rainbow {
    if isdirectory(g:MyPluginPath . "/rainbow")
        let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
    endif
" }

" vim-fugitive {
    if isdirectory(g:MyPluginPath . "/vim-fugitive")
        let s:bundle = neobundle#get('vim-fugitive')
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

        function! s:bundle.hooks.on_post_source(bundle)
            doautoall fugitive BufNewFile
        endfunction
       unlet s:bundle
    endif
" }

" vim-signify {
    if isdirectory(g:MyPluginPath . "/vim-signify")
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
" }
" vim-indent_guides {
    if isdirectory(g:MyPluginPath . "/vim-indent-guides")
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    endif
" }

" NerdTree {
    if isdirectory(g:MyPluginPath . "/nerdtree")
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
    if isdirectory(g:MyPluginPath . "/YouCompleteMe")
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

        " Haskell post write lint and check with ghcmod
        " $ `cabal install ghcmod` if missing and ensure
        " ~/.cabal/bin is in your $PATH.
        if !executable("ghcmod")
            autocmd BufWritePost *.hs GhcModCheckAndLintAsync
        endif

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
    if isdirectory(g:MyPluginPath . "/tagbar")
        nnoremap <silent> <F3> :TagbarToggle<CR>
        "nnoremap <silent> <leader>tt :TagbarToggle<CR>
    endif
" }

" syntastic {
    if isdirectory(g:MyPluginPath . "/syntastic")
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 1
    endif
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
