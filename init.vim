lua require 'user.builtins'
lua require 'user.plugins'
" " modify default colorscheme and statusline
" highlight Normal guibg=NONE ctermbg=NONE guifg=fg
" highlight NormalNC guibg=NONE ctermbg=NONE
" highlight EndOfBuffer guibg=NONE ctermbg=NONE
" " This is embarrasing
" " https://github.com/neovim/neovim/issues/20221
" " And here the solution
" " https://github.com/neovim/neovim/issues/18965
" set laststatus=0
" set cmdheight=0
" highlight link Statusline Normal
" highlight link StatuslineNC Normal
" lua vim.opt.statusline = "%#Comment#" .. string.rep("─", vim.api.nvim_win_get_width(0)) .. "%*"
"
" set number
" set relativenumber
"
" augroup vimrc-dynamic_number_change
"   autocmd!
"   autocmd InsertEnter * set norelativenumber
"   autocmd InsertLeave * set relativenumber
" augroup END
"
" augroup vimrc-highlight_yanked_text
"   autocmd!
"   autocmd TextYankPost * lua vim.highlight.on_yank()
" augroup END
"
" augroup vimrc-remember-cursor-position
"     autocmd!
"     autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" augroup END
" "}}}
" " plugins lua {{{
" lua << EOF
"   require "user.plugins.spec"
"   spec "user.plugins.gitsigns"
"   spec "user.plugins.project"
"   spec "user.plugins.telescope"
"   spec "user.plugins.indentlines"
"   spec "user.plugins.firenvim"
"   -- LSP
"   spec "user.plugins.lspconfig"
"   spec "user.plugins.mason"
"   spec "user.plugins.none-ls"
"   -- Plugins that do it better than builtins
"   spec "user.plugins.treesitter" -- Syntax
"   spec "user.plugins.cmp" -- Completion
"   spec "user.plugins.comment" -- Comments
"   spec "user.plugins.ufo" -- Folds
"
"   require "user.plugins.lazy" -- Plugin installer
" EOF
" "}}}
