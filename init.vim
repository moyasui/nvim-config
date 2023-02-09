call plug#begin('~/.vim/plugged')

Plug 'majutsushi/tagbar'
Plug 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='skim'
    	let g:vimtex_quickfix_mode=0
	set conceallevel=1
	let g:tex_conceal='abdmg'
	let g:vimtex_compiler_progname = 'nvr'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1
Plug 'SirVer/ultisnips'
	let g:UltiSnipsSnippetDirectories=["UltiSnips"]

Plug 'rhysd/vim-grammarous'
Plug 'honza/vim-snippets'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'HIPS/autograd'

Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
Plug 'sickill/vim-monokai'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'joshdick/onedark.vim'
Plug 'dedalozzo/Pygmentize'
Plug 'panozzaj/vim-autocorrect'
call plug#end()

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

setlocal spell
set spelllang=en_gb,da
set spellsuggest=best,9
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

set nu
set rnu
set background=dark
set mouse=a

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree
autocmd filetype latex call AutoCorrect()

call deoplete#custom#option('candidate_marks',
		      \ ['A', 'S', 'D', 'F', 'G'])
		inoremap <expr>A       pumvisible() ?
		\ deoplete#insert_candidate(0) : 'A'
		inoremap <expr>S       pumvisible() ?
		\ deoplete#insert_candidate(1) : 'S'
		inoremap <expr>D       pumvisible() ?
		\ deoplete#insert_candidate(2) : 'D'
		inoremap <expr>F       pumvisible() ?
		\ deoplete#insert_candidate(3) : 'F'
		inoremap <expr>G       pumvisible() ?
		\ deoplete#insert_candidate(4) : 'G'

call neomake#configure#automake('nrwi', 500)

let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<tab>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

let g:airline_theme='<theme>'

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:neomake_python_enabled_makers = ['pylint']

colorscheme onedark
