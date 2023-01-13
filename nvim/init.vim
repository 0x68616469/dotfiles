set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set encoding=UTF-8
set autoindent
set termguicolors
set number
set wildmode=longest,list
filetype plugin indent on
syntax on
syntax enable
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set ttyfast
set noswapfile
set nowrap
set relativenumber
set splitright
set splitbelow
set noshowmode
set shortmess+=F
set guifont="JetBrainsMono Nerd Font"

highlight LineNr ctermfg=grey
highlight EndOfBuffer ctermfg=black

call plug#begin()
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'ryanoasis/vim-devicons'
 Plug 'romgrk/barbar.nvim'
 Plug 'voldikss/vim-floaterm'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-commentary'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'preservim/tagbar'
 Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()

let g:tex_conceal = ""

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_2/bin/ctags'

let g:catppuccin_flavour = "mocha"
lua << EOF
require("catppuccin").setup({
    transparent_background = true,
})
EOF

colorscheme catppuccin 
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1

nnoremap <TAB> <Cmd>NERDTreeToggle<CR>

nnoremap ff <cmd>Telescope find_files<cr>
nnoremap tt <cmd>FloatermToggle<cr>

nnoremap TH  <Cmd>BufferPrevious<CR>
nnoremap TT  <Cmd>BufferNext<CR>
nnoremap TC  <Cmd>BufferClose<CR>
