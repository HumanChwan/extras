" ---------------------plugin---------------------
call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'vifm/vifm.vim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'prettier/vim-prettier', {
	  \ 'do': 'yarn install --frozen-lockfile --production',
	  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

" ---------------------setting---------------------
set termguicolors
set list
set nu rnu
set showcmd
set autoindent
set cursorline
set listchars=tab:\│\ ,trail:·
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab

" Highlight text line number appropriately
hi LineNr guifg=Yellow
hi LineNrAbove ctermfg=Grey
hi LineNrBelow ctermfg=Grey

hi Cursor gui=reverse cterm=none guifg=none

" Detecting filetype
filetype on
filetype plugin on
filetype indent on

" Turning Syntax Highlighting ON 
syntax on

" ---------------------theme---------------------
colorscheme gruvbox
hi Normal ctermbg=none guibg=none

" ---------------------keyap---------------------
map <C-s> :source $MYVIMRC<CR>
map <C-m> vxp
map <C-S-M> yiwwviwpbbviwp
map <C-Space> :EditVifm .<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
map <C-w> ciw

map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
