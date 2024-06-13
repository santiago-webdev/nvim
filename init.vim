" settings {{{
lua vim.loader.enable()

let g:var="alpPrj"
set relativenumber
set number
set clipboard=unnamedplus
set confirm
set smartcase
set autowrite
set mouse=a
set undofile
set timeoutlen=300
set fillchars+=eob:␗
set inccommand=split
set list
set listchars+=tab:»\ ,trail:·,nbsp:␣
set showbreak="↪ "
set cpoptions+=n
set virtualedit="all"
set whichwrap+=h,l,<,>,[,]
set scrolloff=9999
set sidescrolloff=999
set cursorline
set cursorlineopt=number
set splitright
set splitbelow
set hlsearch
set noshowmode
set noruler
set noshowcmd

map <Esc> <cmd>nohlsearch<CR>

highlight Normal NONE
highlight NormalNC NONE
highlight EndOfBuffer NONE

" This is embarrasing
" https://github.com/neovim/neovim/issues/20221
" And here the solution
" https://github.com/neovim/neovim/issues/18965
set laststatus=0
set cmdheight=0
highlight link Statusline Normal
highlight link StatuslineNC Normal
lua vim.opt.statusline = "%#Comment#" .. string.rep("─", vim.api.nvim_win_get_width(0)) .. "%*"

set number
set relativenumber

augroup dynamic_number_change
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup END

augroup highlight_yanked_text
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank()
augroup END
"}}}
" plugins lua {{{
lua << EOF
  require "user.plugins.spec"
  spec "user.plugins.gitsigns"
  spec "user.plugins.project"
  spec "user.plugins.telescope"
  spec "user.plugins.indentlines"
  spec "user.plugins.firenvim"
  -- LSP
  spec "user.plugins.lspconfig"
  spec "user.plugins.mason"
  spec "user.plugins.none-ls"
  -- Plugins that do it better than builtins
  spec "user.plugins.treesitter" -- Syntax
  spec "user.plugins.cmp" -- Completion
  spec "user.plugins.comment" -- Comments
  spec "user.plugins.ufo" -- Folds

  require "user.plugins.lazy" -- Plugin installer
EOF
"}}}
" vim:fdm=marker
