" ---------------------plugin---------------------
call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'itchyny/lightline.vim'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'preservim/nerdtree'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'tpope/vim-surround'
    Plug 'rhysd/vim-clang-format'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'vifm/vifm.vim'
    Plug 'neovim/nvim-lspconfig'
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
if !exists("g:neovide")
    hi Normal ctermbg=none guibg=none
endif

" --------------------NEOVIDE-------------------
if exists("g:neovide")
    let g:neovide_transparency=0.85
    set guifont=JetBrains\ Mono
endif


let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
set showtabline=2

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
nnoremap gh :Lspsaga hover_doc<CR>

" --------------------insert mode----------------

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" ---------------------autocmd-------------------
autocmd BufWritePost *.cpp ClangFormat
autocmd BufWritePost *.c ClangFormat
autocmd BufWritePost *.rs %!rustfmt

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require'lspconfig'.clangd.setup{
    capabilities = capabilities
  }
  require'lspconfig'.pyright.setup{
    capabilities = capabilities
  }
EOF
