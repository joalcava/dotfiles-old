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
set cmdheight=2							" more space for displaying messages
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
Plug 'neoclide/coc.nvim', {'branch': 'releas e'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Omnisharp/omnisharp-vim'
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

" --- COC
" dont pass messages to |ins-completion-menu|
  set shortmess+=c
" Use Tab for trigger completion with characters ahead and navigate.
	inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

" <c-space> triggers completion
  inoremap <silent><expr> <c-space> coc#refresh()

" Show docs of symbol under the cursor
  nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
																\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		elseif (coc#rpc#ready())
			call CocActionAsync('doHover')
		else
			execute '!' . &keywordprg . " " . expand('<cword>')
		endif
	endfunction

" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
	nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
	if has('nvim-0.4.0') || has('patch-8.2.0750')
		nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
		inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
		inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
		vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
		vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
	nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
	nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
	nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
	nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
	nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
	nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
	nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
	nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
	nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
colorscheme gruvbox

" --- lightline
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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
