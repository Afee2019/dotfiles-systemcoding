" Set some plugins
call plug#begin()
    Plug 'windwp/nvim-autopairs'
    Plug 'keitokuch/vterm'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'rakr/vim-one'
    Plug 'yuezk/vim-js'
    Plug 'vimwiki/vimwiki'
    Plug 'glepnir/dashboard-nvim'
    Plug 'Raimondi/delimitMate'
    Plug 'vim-airline/vim-airline'
    Plug 'vifm/vifm'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" some keybindings
nmap <F5> :NERDTree<CR>
nnoremap <silent> <C-f> :Files<CR>

set background=dark
set number
set title
set hidden
set inccommand=split
set mouse=a
set encoding=UTF-8
filetype plugin on

highlight Pmenu ctermbg=red guibg=gray

" add syntax hightlighting
filetype plugin indent on
syntax on

" enable 256 colors support on the terminal
set t_Co=256

" True color if available
let term_program=$TERM_PROGRAM
let g:vim_jsx_pretty_colorful_config = 1 " default 0
let g:airline_powerline_fonts = 1

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
endif

" Specific colorscheme settings (must come after setting your colorscheme).
if (g:colors_name == 'gruvbox')
  if (&background == 'dark')
    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  else
    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
  endif
 endif
endif

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" file manager settings
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'

" jsx
let g:jsx_ext_required = 0

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_enable_auto_hover = 1
