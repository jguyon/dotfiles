" vim:et:sw=2:fdm=marker

" plugins {{{

" auto-install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.local/share/nvim/plugged')

" editing {{{

Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'tpope/vim-sleuth' " Auth-detect indentation
Plug 'tpope/vim-repeat' " Enable '.' operator for custom mappings
Plug 'tpope/vim-surround' " Replace/delete surrounding characters
Plug 'tpope/vim-commentary' " Comment stuff in/out
Plug 'jiangmiao/auto-pairs' " Auto-insert matching bracket, quote...

" }}}
" interface {{{

Plug 'arcticicestudio/nord-vim' " Color scheme
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } " Fuzzy search

" }}}
" integration {{{

Plug 'airblade/vim-gitgutter' " Display git hunks in gutter
Plug 'tpope/vim-fugitive' " Git commands
Plug 'tpope/vim-dispatch' " Run build and test tasks
Plug 'neoclide/coc.nvim', {'branch': 'release'} " IntelliSense
Plug 'vn-ki/coc-clap' " Integrate coc.nvim with vim-clap
Plug 'Shougo/neco-vim' " Required by coc-neco
Plug 'neoclide/coc-neco' " IntelliSense support for vim files

" }}}
" languages {{{

Plug 'stephpy/vim-yaml' " YAML
Plug 'cespare/vim-toml' " TOML
Plug 'dag/vim-fish' " fish shell
Plug 'pangloss/vim-javascript' " JavaScript
Plug 'leafgarland/typescript-vim' " TypeScript
Plug 'maxmellon/vim-jsx-pretty' " JSX/TSX

" }}}

call plug#end()

" }}}
" basics {{{

set shell=bash " Run commands with bash
set mouse=a " Enable mouse
set termguicolors " Enable true colour
set guicursor+=a:Cursor " Force cursor highlight group
set number relativenumber " Show relative line numbers
set signcolumn=yes " Sign column always visible on the left
set cursorline " Highlight current line
set colorcolumn=81 " 80 columns indicator
set nowrap " Do not wrap lines
set showcmd " Show normal mode commands
set ignorecase smartcase " Ignore case in searches, unless using uppercase
set splitright splitbelow " Go to right/bottom when splitting windows
set hidden " Hide abandoned buffers
set showtabline=2 " Always show the tab line
set tabstop=4 " Indent with 4 spaces by default
set completeopt=noinsert,menuone,noselect " Configure completion menu
set shortmess+=c " Don't mask echo messages with completion matches
set pumheight=10 " Height of autocomplete popup
set cmdheight=2 " Give more space for displaying messages
set updatetime=300 " Shorter update time for CursorHold and CursorHoldI
set backup backupdir=~/.local/share/nvim/backup " Enable backups
set swapfile dir=~/.local/share/nvim/backup " Enable swapfile
set undofile undodir=~/.local/share/nvim/backup " Enable undofiles
set history=1000 undolevels=1000 undoreload=10000 " We live in the future
set sessionoptions-=buffers " Don't save hidden buffers in sessions
set exrc " Enable project specific configuration files

" set <leader> key to <space>
let g:mapleader = ' '
let g:maplocalleader = ' '

" Use <esc> to quit terminal mode
tnoremap <esc> <C-\><C-n>

" Automatically reload files changed outside of vim
augroup AUTORELOADCHANGED
  au!
  au FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
augroup END

" No line numbers for terminals and help files
augroup NOLINENUMBERS
  au!
  au TermOpen * setlocal nonumber norelativenumber nomodified
  au FileType help setlocal nonumber norelativenumber
augroup END

" }}}
" statusline {{{

set statusline=
set statusline+=\ %{StatusLineShortPath()}%h%w%q%m%{StatusLineReadOnly()}
set statusline+=%=
set statusline+=%{StatusLineCocStatus()}%{StatusLineGitStatus()}

function! StatusLineShortPath() abort
  let l:filename = expand('%')

  if strlen(l:filename) == 0
    return ''
  elseif &filetype ==# '' && strridx(l:filename, 'term://', 0) == 0
    return substitute(l:filename, '^term://.*//[0-9]*:\(.*\)$', '\1', '')
  elseif &filetype ==# 'help'
    return fnamemodify(l:filename, ':t:r')
  else
    return pathshorten(fnamemodify(l:filename, ':~:.'))
  endif
endfunction

function! StatusLineReadOnly() abort
  if &readonly
    return "[\ue0a2]"
  else
    return ''
  endif
endfunction

function! StatusLineGitStatus() abort
  if !exists('*FugitiveHead') || !exists('*GitGutterGetHunkSummary')
    return ''
  endif

  let l:branch = FugitiveHead()
  let l:hunks = GitGutterGetHunkSummary()

  if strlen(l:branch) == 0
    return ''
  elseif l:hunks[0] > 0 || l:hunks[1] > 0 || l:hunks[2] > 0
    return printf("\u2502 \ue0a0 +%s ~%s -%s ",
      \ l:hunks[0], l:hunks[1], l:hunks[2])
  else
    return printf("\u2502 \ue0a0 %s ", l:branch)
  endif
endfunction

function! StatusLineCocStatus() abort
  if !exists('*coc#status')
    return ''
  endif

  let l:status = coc#status()

  if strlen(l:status) == 0
    return ''
  else
    return printf("\u2502 %s ", l:status)
  endif
endfunction

" }}}
" tabline {{{

set tabline=%!TabLine()

function! TabLine() abort
  let s = ''

  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    let s .= '%' . (i + 1) . 'T'
    let s .= ' %{TabLabel(' . (i + 1) . ')} '
  endfor

  let s .= '%#TabLineFill#%T'
  let s .= '%=%#TabLine#%{TabLineCwd()} '

  return s
endfunction

function! TabLabel(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr -1])
  let short = empty(name) ? '???' : fnamemodify(name, ':t')

  return a:n . ':' . short
endfunction

function! TabLineCwd() abort
  return pathshorten(fnamemodify(getcwd(), ':~'))
endfunction

" }}}
" vim-sleuth {{{

let g:sleuth_automatic = 1

" }}}
" nord-vim {{{

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
colorscheme nord

" }}}
" vim-clap {{{

let g:clap_layout = { 'relative': 'editor' }

nnoremap <silent> <leader>o :Clap files<cr>
nnoremap <silent> <leader>b :Clap buffers<cr>

" }}}
" coc.nvim {{{

let g:coc_global_extensions = [
 \ 'coc-json',
 \ 'coc-tsserver', 
 \ 'coc-eslint',
 \ 'coc-css',
 \ 'coc-html',
 \ 'coc-prettier',
 \ 'coc-emoji',
 \ ]

let g:coc_status_error_sign = '✗'
let g:coc_status_warning_sign = '!'

" Use <tab> to trigger completion and navigate completion items
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion
if exists('*complete_info')
  inoremap <expr> <cr>
        \ complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Common actions
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <c-n> <Plug>(coc-range-select)
vmap <silent> <c-n> <Plug>(coc-range-select)
nmap <silent> <c-p> <Plug>(coc-range-select-backward)
vmap <silent> <c-p> <Plug>(coc-range-select-backward)
nmap <silent> <leader>r <Plug>(coc-rename)
nmap <silent> <leader>f <Plug>(coc-format)
vmap <silent> <leader>f <Plug>(coc-format-selected)

" Operators for selecting functions and classes
vmap <silent> if <Plug>(coc-funcobj-i)
omap <silent> if <Plug>(coc-funcobj-i)
vmap <silent> af <Plug>(coc-funcobj-a)
omap <silent> af <Plug>(coc-funcobj-a)
vmap <silent> ic <Plug>(coc-classobj-i)
omap <silent> ic <Plug>(coc-classobj-i)
vmap <silent> ac <Plug>(coc-classobj-a)
omap <silent> ac <Plug>(coc-classobj-a)

augroup COC
  au!
  " Highlight the symbol and its references when holding the cursor.
  au CursorHold * silent call CocActionAsync('highlight')
  " Update signature help on jump placeholder.
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" }}}
" vim-javascript {{{

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" }}}
