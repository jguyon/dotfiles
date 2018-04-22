" vim:et:sw=2:fdm=marker

" plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

" editing {{{

Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'tpope/vim-sleuth' " Auth-detect indentation
Plug 'tpope/vim-repeat' " Enable '.' operator for custom mappings
Plug 'tpope/vim-surround' " Replace/delete surrounding characters
Plug 'tpope/vim-commentary' " Comment stuff in/out
Plug 'tpope/vim-obsession' " Sensible sessions
Plug 'jiangmiao/auto-pairs' " Auto-insert matching bracket, quote...
Plug 'haya14busa/vim-edgemotion' " Move to edges
Plug 'easymotion/vim-easymotion' " Move around easily

" }}}
" interface {{{

Plug 'arcticicestudio/nord-vim' " Color scheme
Plug 'junegunn/rainbow_parentheses.vim' " Color matching pairs
Plug 'itchyny/lightline.vim' " Status line
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim' " Fuzzy-search everything

" }}}
" integration {{{

Plug 'airblade/vim-gitgutter' " Display git hunks in gutter
Plug 'tpope/vim-fugitive' " Git commands
Plug 'tpope/vim-dispatch' " Run build and test tasks
Plug 'tpope/vim-projectionist' " Project-specific config
Plug 'w0rp/ale' " Linting
Plug 'maximbaz/lightline-ale' " Display error info in status line
Plug 'roxma/nvim-completion-manager' " Auto-completion support
Plug 'Shougo/neco-vim' " VimL completion support
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ } " Language server protocol support

" }}}
" languages {{{

Plug 'stephpy/vim-yaml' " YAML
Plug 'cespare/vim-toml' " TOML
Plug 'dag/vim-fish' " fish shell
Plug 'StanAngeloff/php.vim' " PHP
Plug 'pangloss/vim-javascript' " javascript
Plug 'mxw/vim-jsx' " JSX
Plug 'reasonml-editor/vim-reason-plus' " reasonml

" }}}

call plug#end()

" }}}
" basics {{{

set shell=~/.nix-profile/bin/bash " Run commands with bash
set mouse=a " Enable mouse
set number relativenumber " Show relative line numbers
set signcolumn=yes " Sign column always visible on the left
set cursorline " Highlight current line
set colorcolumn=81 " 80 columns indicator
set foldmethod=syntax " Fold according to language syntax
set foldnestmax=3 " Maximum nesting of closed folds
set showcmd " Show normal mode commands
set ignorecase smartcase " Ignore case in searches, unless using uppercase
set splitright splitbelow " Go to right/bottom when splitting windows
set clipboard+=unnamedplus " Use system clipboard
set hidden " Hide abandoned buffers
set showtabline=1 " Show the tab line if there is more than one tab
set noshowmode " Do not show the current mode (lightline will do that)
set tabstop=4 " Indent with 4 spaces by default
set completeopt-=preview " Don't display annoying window during completion
set shortmess+=c " Don't mask echo messages with completion matches
set pumheight=10 " Height of autocomplete popup
set backup backupdir=~/.local/share/nvim/backup " Enable backups
set swapfile dir=~/.local/share/nvim/backup " Enable swapfile
set undofile undodir=~/.local/share/nvim/backup " Enable undofiles
set history=1000 undolevels=1000 undoreload=10000 " We live in the future
set sessionoptions-=buffers " Don't save hidden buffers in sessions

" Use <esc> to quit terminal mode
tnoremap <esc> <C-\><C-n>

" No line numbers for terminals and help files
augroup NOLINENUMBERS
  au!
  au TermOpen * setlocal nonumber norelativenumber
  au FileType help setlocal nonumber norelativenumber
augroup END

" Use <tab>/<s-tab> to select completion and <cr> to validate
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" }}}
" mappings {{{

let g:mapleader = ' '
let g:maplocalleader = ' '

" global {{{

nmap <leader><leader> <plug>(search-commands)
nmap <leader>? <plug>(search-helptags)
nmap <leader><tab> <plug>(search-mappings)
nmap <leader>/ <plug>(search-search-history)
nmap <leader>: <plug>(search-command-history)
nnoremap <silent> <leader>c :pclose<cr>:lclose<cr>:cclose<cr>

" }}}
" buffers {{{

nnoremap <silent> <leader>bp :bprevious <cr>
nnoremap <silent> <leader>bn :bnext <cr>
nnoremap <silent> <leader>bd :bdelete <cr>
nnoremap <silent> <leader>bD :bdelete! <cr>
nmap <leader>bb <plug>(search-buffers)

" }}}
" windows {{{

nnoremap <silent> <leader>ws :split <cr>
nnoremap <silent> <leader>wv :vsplit <cr>
nnoremap <silent> <leader>wk :wincmd k <cr>
nnoremap <silent> <leader>wj :wincmd j <cr>
nnoremap <silent> <leader>wh :wincmd h <cr>
nnoremap <silent> <leader>wl :wincmd l <cr>
nnoremap <silent> <leader>wK :wincmd K <cr>
nnoremap <silent> <leader>wJ :wincmd J <cr>
nnoremap <silent> <leader>wH :wincmd H <cr>
nnoremap <silent> <leader>wL :wincmd L <cr>
nnoremap <silent> <leader>wd :wincmd c <cr>
nnoremap <silent> <leader>w= :wincmd = <cr>
nnoremap <silent> <leader>w- :resize -5 <cr>
nnoremap <silent> <leader>w+ :resize +5 <cr>
nnoremap <silent> <leader>w< :vertical resize -5 <cr>
nnoremap <silent> <leader>w> :vertical resize +5 <cr>
nmap <leader>ww <plug>(search-windows)

" }}}
" tabs {{{

nnoremap <silent> <leader>tc :tabnew <cr>
nnoremap <silent> <leader>td :tabclose <cr>
nnoremap <silent> <leader>tn :tabnext <cr>
nnoremap <silent> <leader>tp :tabprev <cr>
nnoremap <silent> <leader>tf :tabfirst <cr>
nnoremap <silent> <leader>tl :tablast <cr>
nnoremap <silent> \ :<C-U>execute v:count . 'tabnext' <cr>
nmap <leader>tr <plug>(tab-cd-root)

" }}}
" quit {{{

nnoremap <silent> <leader>qq :qa <cr>
nnoremap <silent> <leader>qQ :qa! <cr>
nnoremap <silent> <leader>qw :wqa <cr>
nnoremap <silent> <leader>qW :wqa! <cr>

" }}}
" files {{{

nnoremap <silent> <leader>fw :w <cr>
nnoremap <silent> <leader>fW :w! <cr>
nmap <leader>ff <plug>(search-files)
nmap <leader>fk <plug>(search-filetypes)
nmap <leader>fh <plug>(search-file-history)
nmap <leader>fa <plug>(file-alternative)

" }}}
" git {{{

nmap <leader>gg <plug>(search-git-files)
nmap <leader>gs <plug>(search-git-status)
nmap <leader>gl <plug>(search-git-log)
nmap <leader>gb <plug>(search-git-log-buffer)
nmap <leader>gc <plug>(git-commit)
nmap <leader>gd <plug>(git-diff)
nmap <leader>gp <plug>(git-push)
nmap <leader>gm <plug>(git-pull)
nmap <leader>ga <plug>(git-authors)

" }}}
" hunks {{{

nmap <leader>hs <plug>(hunk-stage)
nmap <leader>hu <plug>(hunk-undo)
nmap <leader>hp <plug>(hunk-prev)
nmap <leader>hn <plug>(hunk-next)
nmap <leader>hv <plug>(hunk-preview)

" }}}
" linting {{{

nmap <leader>ee <plug>(errors-enable)
nmap <leader>eE <plug>(errors-disable)
nmap <leader>el <plug>(errors-lint)
nmap <leader>ef <plug>(errors-fix)
nmap <leader>ep <plug>(errors-prev)
nmap <leader>en <plug>(errors-next)
nmap <leader>et <plug>(errors-toggle)
nmap <leader>er <plug>(errors-reset)

" }}}
" language {{{

nmap <leader>ll <plug>(lang-enable)
nmap <leader>lL <plug>(lang-disable)
nmap K <plug>(lang-hover)
nmap <cr> <plug>(lang-hover)
nmap <leader>lr <plug>(lang-rename)
nmap <leader>lg <plug>(lang-go-to-def)
nmap <leader>lf <plug>(lang-references)
nmap <leader>ls <plug>(lang-symbols)
nmap <leader>lS <plug>(lang-workspace-symbols)

" }}}
" sessions {{{

nmap <leader>ss <plug>(session-start)
nmap <leader>sS <plug>(session-stop)

" }}}

" }}}
" vim-sleuth {{{

let g:sleuth_automatic = 1

" }}}
" vim-obsession {{{

noremap <silent> <plug>(session-start) :Obsess <cr>
noremap <silent> <plug>(session-stop) :Obsess! <cr>

" }}}
" vim-edgemotion {{{

map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" }}}
" vim-easymotion {{{

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

map ;f <Plug>(easymotion-s)
map ;t <Plug>(easymotion-bd-t)
map ;w <Plug>(easymotion-bd-w)
map ;e <Plug>(easymotion-bd-e)
map ;j <Plug>(easymotion-bd-jk)
map ;n <Plug>(easymotion-bd-n)
map ;s <Plug>(easymotion-s2)
map ;z <Plug>(easymotion-bd-t2)
map ;r <Plug>(easymotion-repeat)

" }}}
" nord {{{

let g:nord_italic = 1
let g:nord_italic_comments = 1

colorscheme nord

hi! link ALEError NONE
hi! link ALEWarning NONE

" }}}
" rainbow_parentheses.vim {{{

let g:rainbow#pairs = [ [ '(', ')' ], [ '{', '}' ], [ '[', ']' ] ]
augroup rainbow
  au!
  au VimEnter * RainbowParentheses
augroup END

" }}}
" lightline {{{

let g:lightline = {}
let g:lightline.colorscheme = 'nord'

" layout {{{

let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }

let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste', 'readonly' ],
  \           [ 'githunks', 'filename', 'modified' ] ],
  \ 'right': [ [ 'linter_ok', 'linter_warnings', 'linter_errors' ],
  \            [ 'lineinfo' ],
  \            [ 'filetype' ] ],
  \ }

let g:lightline.inactive = {
  \ 'left': [ [], [ 'filename' ] ],
  \ 'right': [ [], [ 'lineinfo' ] ],
  \ }

let g:lightline.tab = {
  \ 'active': [ 'tabnum', 'tabcwd' ],
  \ 'inactive': [ 'tabnum', 'tabcwd' ],
  \ }

let g:lightline.mode_map = {
  \ 'n': 'n', 'i': 'i', 'R': 'R', 'v': 'v', 'V': 'V', "\<C-v>": 'C-v',
  \ 'c': 'c', 's': 's', 'S': 'S', "\<C-s>": 'C-s', 't': 't',
  \ }

" }}}
" components {{{

let g:lightline.component = {
  \ 'lineinfo': "\ue0a1 %3l:%-2c / %L",
  \ }

let g:lightline.component_function = {
  \ 'filename': 'init#lightline_shortpath',
  \ 'readonly': 'init#lightline_readonly',
  \ 'githunks': 'init#lightline_githunks',
  \ }

let g:lightline.component_expand = {
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_errors': 'lightline#ale#errors',
  \ 'linter_ok': 'lightline#ale#ok',
  \ }

let g:lightline.component_type = {
  \ 'linter_warnings': 'warning',
  \ 'linter_errors': 'error',
  \ }

let g:lightline.tab_component_function = {
  \ 'tabcwd': 'init#lightline_tabcwd'
  \ }

function! init#lightline_shortpath() abort
  let l:filename = expand('%')

  if strlen(l:filename) > 0
    return pathshorten(fnamemodify(expand('%'), ':~:.'))
  else
    return ''
  endif
endfunction

function! init#lightline_readonly() abort
  if &readonly
    return "\ue0a2"
  else
    return ''
  endif
endfunction

function! init#lightline_githunks() abort
  if !exists('*fugitive#head') || !exists('*GitGutterGetHunkSummary')
    return ''
  endif

  let l:branch = fugitive#head()
  let l:hunks = GitGutterGetHunkSummary()

  if strlen(l:branch) == 0
    return ''
  elseif l:hunks[0] > 0 || l:hunks[1] > 0 || l:hunks[2] > 0
    return printf("\ue0a0 +%-2s ~%-2s -%-2s",
      \ l:hunks[0], l:hunks[1], l:hunks[2])
  else
    return printf("\ue0a0 %s", l:branch)
  endif
endfunction

function! init#lightline_tabcwd(tabnr) abort
  let l:dirname = getcwd(-1, a:tabnr)

  if strlen(l:dirname) > 0
    return pathshorten(fnamemodify(l:dirname, ':~'))
  else
    return ''
  endif
endfunction

" }}}

" }}}
" fzf.vim {{{

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

augroup FZF
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler
augroup END

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir GFilesPreview
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

noremap <silent> <plug>(search-files) :Files <cr>
noremap <silent> <plug>(search-buffers) :Buffers <cr>
noremap <silent> <plug>(search-windows) :Windows <cr>
noremap <silent> <plug>(search-commands) :Commands <cr>
noremap <silent> <plug>(search-file-history) :History <cr>
noremap <silent> <plug>(search-command-history) :History: <cr>
noremap <silent> <plug>(search-search-history) :History/ <cr>
noremap <silent> <plug>(search-helptags) :Helptags <cr>
noremap <silent> <plug>(search-mappings) :Maps <cr>
noremap <silent> <plug>(search-filetypes) :Filetypes <cr>
noremap <silent> <plug>(search-git-files) :GFilesPreview <cr>
noremap <silent> <plug>(search-git-status) :GFiles?<cr>
noremap <silent> <plug>(search-git-log) :Commits <cr>
noremap <silent> <plug>(search-git-log-buffer) :BCommits <cr>

" }}}
" vim-gitgutter {{{

let g:gitgutter_map_keys = 0

nmap <silent> <plug>(hunk-stage) <plug>GitGutterStageHunk
nmap <silent> <plug>(hunk-undo) <plug>GitGutterUndoHunk
nmap <silent> <plug>(hunk-prev) <plug>GitGutterPrevHunk
nmap <silent> <plug>(hunk-next) <plug>GitGutterNextHunk
nmap <silent> <plug>(hunk-preview) <plug>GitGutterPreviewHunk

" }}}
" vim-fugitive {{{

nnoremap <silent> <plug>(git-commit) :Gcommit <cr>
nnoremap <silent> <plug>(git-push) :Gpush <cr>
nnoremap <silent> <plug>(git-pull) :Gpull <cr>
nnoremap <silent> <plug>(git-diff) :Gdiff <cr>
nnoremap <silent> <plug>(git-authors) :Gblame <cr>

" }}}
" vim-projectionist {{{

let g:projectionist_heuristics = {
  \ 'bsconfig.json': {
  \   '*': {
  \     'start': 'bsb -make-world -w',
  \     'make': 'bsb -make-world',
  \   },
  \   'src/*.re': {
  \     'alternate': 'src/{}.rei',
  \     'type': 'source',
  \   },
  \   'src/*.rei': {
  \     'alternate': 'src/{}.re',
  \     'type': 'interface',
  \   },
  \   'src/*.bs.js': {
  \     'alternate': 'src/{}.re',
  \     'type': 'target',
  \   },
  \ },
  \ 'bsconfig.json&node_modules/.bin/jest': {
  \   '*_test.re': {
  \     'dispatch': 'node_modules/.bin/jest {}_test.bs.js',
  \   },
  \ },
  \ }

nnoremap <silent> <plug>(file-alternative) :A <cr>
nnoremap <silent> <plug>(tab-cd-root) :call init#tab_cd() <cr>

function! init#tab_cd() abort
  exec 'tcd projectionist#path()'
endfunction

" }}}
" ale {{{

let g:lightline#ale#indicator_ok = "\u2713"
let g:ale_sign_error = "\u2716"
let g:lightline#ale#indicator_errors = g:ale_sign_error
let g:ale_sign_warning = "\u26a0"
let g:lightline#ale#indicator_warnings = g:ale_sign_warning
let g:ale_sign_info = "\u2139"
let g:ale_open_list = 'on_save'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'json': ['prettier'],
  \ 'css': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'reason': ['refmt'],
  \ }

nnoremap <silent> <plug>(errors-enable) :ALEEnable<cr>
nnoremap <silent> <plug>(errors-disable) :ALEDisable<cr>
nmap <plug>(errors-lint) <plug>(ale_lint)
nmap <plug>(errors-fix) <plug>(ale_fix)
nmap <plug>(errors-prev) <plug>(ale_previous_wrap)
nmap <plug>(errors-next) <plug>(ale_next_wrap)
nmap <plug>(errors-toggle) <plug>(ale_toggle_buffer)
nmap <plug>(errors-reset) <plug>(ale_reset_buffer)

" }}}
" lsp {{{

let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_selectionUI = 'fzf'

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'reason': ['ocaml-language-server', '--stdio'],
  \ 'ocaml': ['ocaml-language-server', '--stdio'],
  \ }

let g:LanguageClient_rootMarkers = {
  \ 'javascript': ['package.json'],
  \ 'javascript.jsx': ['package.json'],
  \ 'reason': ['bsconfig.json'],
  \ 'ocaml': ['bsconfig.json'],
  \ }

noremap <silent> <plug>(lang-enable)
  \ :LanguageClientStart <cr>
noremap <silent> <plug>(lang-disable)
  \ :LanguageClientStop <cr>
noremap <silent> <plug>(lang-hover)
  \ :call LanguageClient_textDocument_hover() <cr>
noremap <silent> <plug>(lang-rename)
  \ :call LanguageClient_textDocument_rename() <cr>
noremap <silent> <plug>(lang-go-to-def)
  \ :call LanguageClient_textDocument_definition() <cr>
noremap <silent> <plug>(lang-symbols)
  \ :call LanguageClient_textDocument_documentSymbol() <cr>
noremap <silent> <plug>(lang-references)
  \ :call LanguageClient_textDocument_references() <cr>
noremap <silent> <plug>(lang-workspace-symbols)
  \ :call LanguageClient_workspace_symbol() <cr>

" }}}
" javascript {{{

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" }}}
