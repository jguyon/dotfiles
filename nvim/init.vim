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
Plug 'haya14busa/vim-edgemotion' " Move to edges
Plug 'easymotion/vim-easymotion' " Move around easily

" }}}
" interface {{{

Plug 'yuttie/inkstained-vim' " Color scheme
Plug 'junegunn/rainbow_parentheses.vim' " Color matching pairs
Plug 'itchyny/lightline.vim' " Status line
Plug 'vim-ctrlspace/vim-ctrlspace' " Workspace management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim' " Fuzzy-search everything

" }}}
" integration {{{

Plug 'airblade/vim-gitgutter' " Display git hunks in gutter
Plug 'tpope/vim-fugitive' " Git commands
Plug 'tpope/vim-dispatch' " Run build and test tasks
Plug 'w0rp/ale' " Linting
Plug 'maximbaz/lightline-ale' " Display error info in status line
Plug 'ncm2/ncm2' " Auto-completions
Plug 'roxma/nvim-yarp' " Required by ncm2
Plug 'ncm2/ncm2-bufword' " Auto-complete words from current buffer
Plug 'ncm2/ncm2-path' " Auto-complete paths
Plug 'ncm2/ncm2-tmux' " Auto-complete words from other tmux panes
Plug 'Shougo/neco-vim' " Required to auto-complete syntax
Plug 'ncm2/ncm2-vim' " Auto-complete VimScript
Plug 'ncm2/ncm2-cssomni' " Auto-complete CSS
Plug 'ncm2/ncm2-html-subscope' " Detect JS/CSS subscope in HTML
Plug 'ncm2/ncm2-markdown-subscope' " Detect code blocks in Markdown
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ } " Language server protocol support

" }}}
" languages {{{

Plug 'stephpy/vim-yaml' " YAML
Plug 'cespare/vim-toml' " TOML
Plug 'dag/vim-fish' " fish shell
Plug 'pangloss/vim-javascript' " javascript
Plug 'mxw/vim-jsx' " JSX
Plug 'reasonml-editor/vim-reason-plus' " reasonml
Plug 'ElmCast/elm-vim' " elm

" }}}

call plug#end()

" }}}
" basics {{{

set shell=$SHELL " Run commands with bash
set mouse=a " Enable mouse
set termguicolors " Enable true colour
set guicursor=a:Cursor " Force cursor highlight group
set number relativenumber " Show relative line numbers
set signcolumn=yes " Sign column always visible on the left
set cursorline " Highlight current line
set colorcolumn=81 " 80 columns indicator
set showcmd " Show normal mode commands
set ignorecase smartcase " Ignore case in searches, unless using uppercase
set splitright splitbelow " Go to right/bottom when splitting windows
set clipboard+=unnamedplus " Use system clipboard
set hidden " Hide abandoned buffers
set showtabline=1 " Show the tab line if there is more than one tab
set noshowmode " Do not show the current mode (lightline will do that)
set tabstop=4 " Indent with 4 spaces by default
set completeopt=noinsert,menuone,noselect " Configure completion menu
set shortmess+=c " Don't mask echo messages with completion matches
set pumheight=10 " Height of autocomplete popup
set backup backupdir=~/.local/share/nvim/backup " Enable backups
set swapfile dir=~/.local/share/nvim/backup " Enable swapfile
set undofile undodir=~/.local/share/nvim/backup " Enable undofiles
set history=1000 undolevels=1000 undoreload=10000 " We live in the future
set sessionoptions-=buffers " Don't save hidden buffers in sessions

" Theme
colorscheme inkstained

" Use <esc> to quit terminal mode
tnoremap <esc> <C-\><C-n>

" No line numbers for terminals and help files
augroup NOLINENUMBERS
  au!
  au TermOpen * setlocal nonumber norelativenumber nomodified
  au FileType help setlocal nonumber norelativenumber
augroup END

" Do not warn when closing terminal
" augroup TERMINALNOMODIFIED
"   au!
"   au TermOpen * setlocal modified
" augroup END

" Use <tab>/<s-tab> to select completion and <cr> to validate
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" set <leader> key to <space>
let g:mapleader = ' '
let g:maplocalleader = ' '

" }}}
" mappings {{{

" general {{{

nmap <c-space> <plug>(ctrlspace)
nmap <leader><leader> <plug>(search-commands)
nmap <leader>: <plug>(search-command-history)
nmap <leader>? <plug>(search-help)
nmap <leader><tab> <plug>(search-mappings)

" }}}
" quit {{{

nnoremap <silent> <leader>qq :qa <cr>
nnoremap <silent> <leader>qQ :qa! <cr>
nnoremap <silent> <leader>qw :wqa <cr>
nnoremap <silent> <leader>qW :wqa! <cr>

" }}}
" current buffer {{{

nnoremap <silent> <leader>fw :write <cr>
nnoremap <silent> <leader>fW :write! <cr>
nmap <leader>ff <plug>(search-files)

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

" }}}
" terminal {{{

nnoremap <silent> <leader>t :call LaunchTerminal() <cr>
nnoremap <silent> <leader>T :call PromptCommand() <cr>

function! LaunchTerminal() abort
  terminal
  startinsert
endfunction

function! LaunchCommand(cmd) abort
  execute 'edit term://' . getcwd() . '//' . a:cmd
  startinsert
endfunction

function! PromptCommand() abort
  call inputsave()
  let l:cmd = input('Enter a command: ')
  call inputrestore()
  call LaunchCommand(l:cmd)
endfunction

" }}}
" git {{{

nmap <leader>gs <plug>(git-status)
nmap <leader>gc <plug>(git-commit)
nmap <leader>gd <plug>(git-diff)
nmap <leader>gp <plug>(git-push)
nmap <leader>gm <plug>(git-pull)
nmap <leader>ga <plug>(git-authors)
nmap <silent>gl <plug>(search-git-commits-current)
nmap <silent>gL <plug>(search-git-commits)

" }}}
" hunks {{{

nmap <leader>hs <plug>(hunk-stage)
nmap <leader>hu <plug>(hunk-undo)
nmap <leader>hp <plug>(hunk-prev)
nmap <leader>hn <plug>(hunk-next)
nmap <leader>hv <plug>(hunk-preview)

" }}}
" linting {{{

nmap J <plug>(errors-detail)
nmap <leader>ee <plug>(errors-enable)
nmap <leader>eE <plug>(errors-disable)
nmap <leader>el <plug>(errors-lint)
nmap <leader>ef <plug>(errors-fix)
nmap <leader>ep <plug>(errors-prev)
nmap <leader>en <plug>(errors-next)
nmap <leader>et <plug>(errors-toggle)
nmap <leader>er <plug>(errors-reset)

" }}}
" language server {{{

nmap K <plug>(lang-hover)
nmap <leader>ii <plug>(lang-enable)
nmap <leader>iI <plug>(lang-disable)
nmap <leader>ir <plug>(lang-rename)
nmap <leader>id <plug>(lang-go-to-def)
nmap <leader>it <plug>(lang-go-to-typedef)
nmap <leader>im <plug>(lang-go-to-impl)

" }}}
" motions {{{

map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)
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

" }}}
" vim-sleuth {{{

let g:sleuth_automatic = 1

" }}}
" vim-easymotion {{{

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" }}}
" inkstained-vim {{{

if exists('g:colors_name') && g:colors_name ==# 'inkstained'
  hi! link ALEError NONE
  hi! link ALEWarning NONE
  hi! CursorLine cterm=NONE gui=NONE
  hi! link ColorColumn CursorLine

  let g:terminal_color_0 = '#dfddd7'
  let g:terminal_color_1 = '#aa586e'
  let g:terminal_color_2 = '#608f8e'
  let g:terminal_color_3 = '#447487'
  let g:terminal_color_4 = '#56759a'
  let g:terminal_color_5 = '#7c6a93'
  let g:terminal_color_6 = '#a05b89'
  let g:terminal_color_7 = '#555f6f'
  let g:terminal_color_8 = '#d3d1cc'
  let g:terminal_color_9 = g:terminal_color_1
  let g:terminal_color_10 = g:terminal_color_2
  let g:terminal_color_11 = g:terminal_color_3
  let g:terminal_color_12 = g:terminal_color_4
  let g:terminal_color_13 = g:terminal_color_5
  let g:terminal_color_14 = g:terminal_color_6
  let g:terminal_color_15 = '#929cad'
endif

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

" colorscheme {{{

if exists('g:colors_name')
  let g:lightline.colorscheme = g:colors_name
endif

" }}}
" layout {{{

let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }

let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste', 'readonly' ],
  \           [ 'githunks', 'filename', 'modified' ] ],
  \ 'right': [ [ 'linter_checking', 'linter_ok', 'linter_warnings', 'linter_errors' ],
  \            [ 'lineinfo' ],
  \            [ 'filetype' ] ],
  \ }

let g:lightline.inactive = {
  \ 'left': [ [], [ 'filename' ] ],
  \ 'right': [ [], [ 'lineinfo' ] ],
  \ }

let g:lightline.tab = {
  \ 'active': [ 'tabnum', 'tabtitle', 'modified' ],
  \ 'inactive': [ 'tabnum', 'tabtitle', 'modified' ],
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
  \ 'mode': 'LightlineMode',
  \ 'filename': 'LightlineShortpath',
  \ 'readonly': 'LightlineReadOnly',
  \ 'githunks': 'LightlineGitHunks',
  \ }

let g:lightline.component_expand = {
  \ 'linter_checking': 'lightline#ale#checking',
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_errors': 'lightline#ale#errors',
  \ 'linter_ok': 'lightline#ale#ok',
  \ }

let g:lightline.component_type = {
  \ 'linter_checking': 'left',
  \ 'linter_warnings': 'warning',
  \ 'linter_errors': 'error',
  \ 'linter_ok': 'left',
  \ }

let g:lightline.tab_component_function = {
  \ 'tabnum': 'LightlineTabNum',
  \ 'tabtitle': 'LightlineTabTitle',
  \ }

function! LightlineMode() abort
  if &filetype ==# 'denite'
    return 'denite'
  elseif &filetype ==# 'ctrlspace'
    return 'ctrlspace'
  else
    return lightline#mode()
  endif
endfunction

function! LightlineShortpath() abort
  let l:filename = expand('%')

  if strlen(l:filename) == 0
    return ''
  elseif &filetype ==# '' && strridx(l:filename, 'term://', 0) == 0
    return substitute(l:filename, '^term://.*//[0-9]*:\(.*\)$', '\1', '')
  elseif &filetype ==# 'denite'
    return denite#get_status('buffer_name')
  elseif &filetype ==# 'ctrlspace'
    return ctrlspace#api#StatuslineModeSegment(
      \ ' ' . g:lightline.subseparator.left . ' ')
  elseif &filetype ==# 'help'
    return fnamemodify(l:filename, ':t:r')
  else
    return pathshorten(fnamemodify(expand('%'), ':~:.'))
  endif
endfunction

function! LightlineReadOnly() abort
  if &readonly
    return "\ue0a2"
  else
    return ''
  endif
endfunction

function! LightlineGitHunks() abort
  if &filetype ==# 'denite' || &filetype ==# 'ctrlspace'
    return ''
  endif

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

function! LightlineTabNum(n) abort
  return a:n . ctrlspace#api#TabBuffersNumber(a:n)
endfunction

function! LightlineTabTitle(n) abort
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)
  let l:bufnr = l:buflist[l:winnr - 1]
  return ctrlspace#api#TabTitle(a:n, l:bufnr, expand('#'. l:bufnr . ':t'))
endfunction

" }}}

" }}}
" vim-ctrlspace {{{

let g:CtrlSpaceSetDefaultMapping = 0
let g:CtrlSpaceSearchTiming = 100
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceGlobCommand = 'ag --follow --nocolor --nogroup -g ""'

nnoremap <silent> <plug>(ctrlspace) :CtrlSpace<cr>

" }}}
" fzf.vim {{{

let $FZF_DEFAULT_COMMAND = 'ag -l --nocolor -g ""'
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'MatchParen'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'MatchParen'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Don't display status line with fzf
augroup FZF
  au!
  au FileType fzf set laststatus=0 noshowmode noruler
    \| au BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

nnoremap <silent> <plug>(search-help) :FzfHelptags<cr>
nnoremap <silent> <plug>(search-commands) :FzfCommands<cr>
nnoremap <silent> <plug>(search-command-history) :FzfHistory:<cr>
nnoremap <silent> <plug>(search-mappings) :FzfMaps<cr>
nnoremap <silent> <plug>(search-files) :FzfFiles<cr>
nnoremap <silent> <plug>(search-git-commits) :FzfCommits<cr>
nnoremap <silent> <plug>(search-git-commits-current) :FzfBCommits<cr>

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

nnoremap <silent> <plug>(git-status) :Gstatus <cr>
nnoremap <silent> <plug>(git-commit) :Gcommit <cr>
nnoremap <silent> <plug>(git-push) :Gpush <cr>
nnoremap <silent> <plug>(git-pull) :Gpull <cr>
nnoremap <silent> <plug>(git-diff) :Gdiff <cr>
nnoremap <silent> <plug>(git-authors) :Gblame <cr>

" }}}
" ale {{{

let g:lightline#ale#indicator_checking = "\u2026"
let g:lightline#ale#indicator_ok = "\u2713"
let g:ale_sign_error = "\u2716"
let g:lightline#ale#indicator_errors = g:ale_sign_error
let g:ale_sign_warning = "\u26a0"
let g:lightline#ale#indicator_warnings = g:ale_sign_warning
let g:ale_sign_info = "\u2139"
let g:ale_open_list = 0
let g:ale_lint_on_enter = 0
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
nmap <plug>(errors-detail) <plug>(ale_detail)

" }}}
" ncm2 {{{

autocmd BufEnter * call ncm2#enable_for_buffer()

" }}}
" lsp {{{

let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 0

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

nnoremap <silent> <plug>(lang-enable)
  \ :LanguageClientStart <cr>
nnoremap <silent> <plug>(lang-disable)
  \ :LanguageClientStop <cr>
nnoremap <silent> <plug>(lang-hover)
  \ :call LanguageClient_textDocument_hover() <cr>
nnoremap <silent> <plug>(lang-rename)
  \ :call LanguageClient_textDocument_rename() <cr>
nnoremap <silent> <plug>(lang-go-to-def)
  \ :call LanguageClient_textDocument_definition() <cr>
nnoremap <silent> <plug>(lang-go-to-typedef)
  \ :call LanguageClient_textDocument_typeDefinition() <cr>
nnoremap <silent> <plug>(lang-go-to-impl)
  \ :call LanguageClient_textDocument_implementation() <cr>

" }}}
" javascript {{{

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" }}}
" elm {{{

let g:elm_setup_keybindings = 0

" }}}
