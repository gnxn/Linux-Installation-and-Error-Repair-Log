" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

set nocompatible
filetype plugin indent on
syntax on

" Plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
 Plug 'junegunn/seoul256.vim'
 Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
 Plug 'SirVer/ultisnips' 

 Plug 'honza/vim-snippets'

" On-demand loading
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
 Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
 Plug '~/my-prototype-plugin'

    " Snippets
    Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

" Track the engine.
	Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" Snippets are separated from the engine. Add this if you want them:

    Plug 'Raimondi/delimitMate'
		let g:delimitMate_expand_cr = 1
   	Plug 'editorconfig/editorconfig-vim'

    "Files
    Plug 'francoiscabrol/ranger.vim'

    Plug 'junegunn/fzf'
        Plug 'junegunn/fzf.vim'
            nnoremap <C-P> :FZF<CR>
            nnoremap <Leader>; :Buffers<CR>
    Plug 'scrooloose/nerdtree'

    "Snippets
    Plug 'honza/vim-snippets'

    " Theme
    Plug 'ayu-theme/ayu-vim'

    " undo tree
    Plug 'sjl/gundo.vim'
        let g:gundo_prefer_python3 = 1


    " Languages 
    Plug 'w0rp/ale'
        let g:ale_sign_error='•'
        let g:ale_sign_warning='•'
        let g:ale_pattern_options = {
            \   '.*\.tex': {'ale_enabled': 0},
        \}
        let g:ale_linters = {
            \   'bash': ['shellcheck', 'shell']
        \}


    "C++
    Plug 'rhysd/vim-clang-format'

    	" Javascript
    Plug 'othree/yajs.vim'
    Plug 'othree/es.next.syntax.vim'
    Plug 'chemzqm/vim-jsx-improve'
    Plug 'ternjs/tern_for_vim'
    Plug 'tbastos/vim-lua'
    Plug 'zah/nim.vim'

	" Web development
    Plug 'hail2u/vim-css3-syntax'
    Plug 'chrisbra/Colorizer'
    Plug 'othree/html5.vim'

	" LaTeX
    Plug 'lervag/vimtex'
    Plug '907th/vim-auto-save'
    "Plug 'KeitaNakamura/tex-conceal.vim'
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0



    Plug 'tommcdo/vim-exchange'

    " Other languages
    Plug 'jalvesaq/Nvim-R'
    Plug 'andymass/vim-matlab'

    " Python
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'nvie/vim-flake8'
    Plug 'tell-k/vim-autopep8'

call plug#end()


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDirctories='/home/michael/.vim/bundle'

set cursorline

" Appearances
set termguicolors     " enable true colors support

let ayucolor="mirage"   " for dark version of theme

colorscheme ayu

" Powerline
"
"
" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
let g:powerline_pycmd = 'py3'
set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

set relativenumber

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set grepprg=grep\ -nH\ $*

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'
set iskeyword+=:

" show existing tab with 4 spaces width
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set sidescroll=1
set sidescrolloff=15
set smartcase
set smartindent
set smarttab
set tabpagemax=50
set timeout
set ttimeoutlen=50

set textwidth=80

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
map I :!latexmk -pdf -pv %<CR><CR>

map S :!latexmk -pdf -f %<CR><CR>

map <C-n> :NERDTreeToggle<CR>


set scrolloff=10

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
