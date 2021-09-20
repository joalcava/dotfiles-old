"-----------------------------------------------------------
" Basic configurations
"-----------------------------------------------------------

" Install vim plug if it is not installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

filetype plugin on
 let mapleader = " "

set nocompatible            "vim defaults not vi
set title
set go=a
set nohlsearch
set noshowmode
set noruler
set laststatus=2
set t_Co=256
set noshowcmd
set termguicolors
set ignorecase

set encoding=utf-8          "encoding
set hlsearch                "highlight search matches
set expandtab               "indent using spaces instead of tabs
set shiftwidth=2            "the number of spaces to use for each indent
set softtabstop=2           "number of spaces to use for a <Tab> during editing operations
set spelllang=en,es   	    "add es and en dictionaries to spelling
set nowrap                  "don't wrap lines
set showtabline=2           "always enable tabs
set bs=2                    "allow backspacing over everything in insert mode
set ai                      "always set autoindenting on
set showmatch               "show matching brackets
set hidden                  "allows to switch between multiple buffers without saving
set mouse=a                 "allows use of mouse
set mousemodel=popup_setpos "enables mouse menu
set mousehide               "hide the mouse pointer while typing.
set clipboard+=unnamedplus  "yank naturally
set history=99              "set the history size to maximum
set splitbelow              "more naturall split opening
set splitright              "more naturall split opening
set noeb vb t_vb=           "disable beep
au GUIEnter * set vb t_vb=  "disable beep
syntax on                   "switch on syntax highlighting.
set cc=80                   "column at 80 characters
set number relativenumber   "use relative numbers

	nnoremap c "_c
" Enable autocompletion:
	" set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

"-----------------------------------------------------------
" Appearance and gui
"-----------------------------------------------------------
set go-=T                   "removes the toolbar
set go-=m                   "remove menu bar
set go-=r                   "remove right-hand scroll bar
set go-=L                   "remove left-hand scroll bar
set background=dark         "use dark themes

set guifont=JetBrains\ Mono:h16:sb

"-----------------------------------------------------------
" Plugins
"-----------------------------------------------------------
call plug#begin('~/.vim/plugged')

"syntax and languages
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Omnisharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'

" git
Plug 'mhinz/vim-signify'

"file and directory management
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" movement
Plug 'justinmk/vim-sneak'

"util
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'

"themes and appearance
Plug 'romgrk/barbar.nvim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'danilo-augusto/vim-afterglow'
Plug 'srcery-colors/srcery-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'franbach/miramare'
Plug 'jaredgorski/spacecamp'
Plug 'haishanh/night-owl.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

"-----------------------------------------------------------
" Bindings and configs
"-----------------------------------------------------------

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" switch between splits more easily
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

" set tab features just like browser
  map <C-t> <Esc>:tabnew<CR>
  map <C-w> <Esc>:tabclose<CR>
  map <C-Tab> <Esc>:tabnext<CR>
  map <C-S-Tab> <Esc>:tabprev<CR>

" allow to go up an down wrapped lines
  map j gj
  map k gk

" moving lines and preserving indentation
  nnoremap <C-Up> :m .+1<CR>==
  nnoremap <C-Down> :m .-2<CR>==
  inoremap <C-Up> <Esc>:m .+1<CR>==gi
  inoremap <C-Down> <Esc>:m .-2<CR>==gi
  vnoremap <C-Up> :m '>+1<CR>gv=gv
  vnoremap <C-Down> :m '<-2<CR>gv=gv

" reload vimrc
  nmap <leader>rc :so $MYVIMRC<CR>

" split the current file
  map <F6> :split<CR>
  map <S-F6> : vsplit<CR>

" clear search with shift+enter
  nnoremap <C-x> :noh<CR>

" create a mark
  nnoremap gm m

" open fzf using only git files
  nnoremap <C-p> :GFiles<CR>
  nnoremap <leader>p :FZF<CR>

" Tabs bindings
  noremap <leader>1 1gt
  noremap <leader>2 2gt
  noremap <leader>3 3gt
  noremap <leader>4 4gt
  noremap <leader>5 5gt
  noremap <leader>6 6gt
  noremap <leader>7 7gt
  noremap <leader>8 8gt
  noremap <leader>9 9gt
  noremap <leader>0 :tablast<cr>

" Go next and previous tab
nnoremap <Leader>[ :bprev<CR>
nnoremap <Leader>] :bnext<CR>

" Go next and previous tab
nnoremap <C-n> :tabprev<CR>
nnoremap <C-m> :tabnext<CR>

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

"-----------------------------------------------------------
" Plugin specific
"-----------------------------------------------------------

" --- vim-signify
set updatetime=100

" --- Deoplete
let g:deoplete#enable_at_startup = 1

" --- ALE
  nnoremap <C-Right> :ALENext<CR>
  nnoremap <C-Left> :ALEPrevious<CR>
  nnoremap <leader>h :ALEHover<CR>
  nnoremap <leader>jd :ALEGoToDefinition<CR>
  nnoremap <leader>fr :ALEFindReferences<CR>
  nnoremap <leader>rr :ALERename<CR>
	nnoremap <leader>im :ALEImport<CR>
	let g:ale_completion_autoimport = 1
  let g:ale_fixers = ['prettier', 'eslint']
  let g:ale_fix_on_save = 1   "fix on save

  let g:ale_completion_symbols = {
		\ 'text': '',
		\ 'method': '',
		\ 'function': '',
		\ 'constructor': '',
		\ 'field': '',
		\ 'variable': '',
		\ 'class': '',
		\ 'interface': '',
		\ 'module': '',
		\ 'property': '',
		\ 'unit': 'unit',
		\ 'value': 'val',
		\ 'enum': '',
		\ 'keyword': 'keyword',
		\ 'snippet': '',
		\ 'color': 'color',
		\ 'file': '',
		\ 'reference': 'ref',
		\ 'folder': '',
		\ 'enum member': '',
		\ 'constant': '',
		\ 'struct': '',
		\ 'event': 'event',
		\ 'operator': '',
		\ 'type_parameter': 'type param',
		\ '<default>': 'v'
  \ }

" --- Goyo
" makes text more readable when writing prose
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" --- NERDTree
	map <leader>n :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" --- tokyonight
let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "terminal" ]

" --- colorscheme
colorscheme afterglow
"chi Normal guibg=None ctermbg=NONE

" --- lightline
let g:lightline = {'colorscheme': 'darcula'}

" --- webdevicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1


"-----------------------------------------------------------
" Langugae Specific
"-----------------------------------------------------------

" JAVASCRIPT

" --- AutoCloseTag
let g:closetag_filenames = "*.html,*.jsx,*.js,*.tsx"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }


let g:jsx_ext_required=0    "allow JSX in .js files

"-----------------------------------------------------------
" Other
"-----------------------------------------------------------
let g:OmniSharp_selector_ui = 'fzf'

let g:VM_maps = {}
let g:VM_maps["Undo"]      = 'u'
let g:VM_maps["Redo"]      = '<C-r>'
