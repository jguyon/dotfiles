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

Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim' " Status line
Plug 'vim-ctrlspace/vim-ctrlspace' " Workspace management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim' " Fuzzy-search everything

" }}}
" integration {{{

Plug 'sheerun/vim-polyglot' " Language support
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

call plug#end()

" }}}
" core {{{

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
set exrc " Enable project specific configuration files

" set <leader> key to <space>
let g:mapleader = ' '
let g:maplocalleader = ' '

nnoremap <silent> <leader>w :write<cr>
nnoremap <silent> <leader>W :write!<cr>
nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>Q :qa!<cr>

" Use <tab>/<s-tab> to select completion and <cr> to validate
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

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
" vim-sleuth {{{

let g:sleuth_automatic = 1

" }}}
" vim-edgemotion {{{

map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" }}}
" vim-easymotion {{{

let g:EasyMotion_leader_key = ';'

" }}}
" nord-vim {{{

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
colorscheme nord

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
  \ 'mode': 'lightline#mode',
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

function! LightlineShortpath() abort
  let l:filename = expand('%')

  if strlen(l:filename) == 0
    return ''
  elseif &filetype ==# '' && strridx(l:filename, 'term://', 0) == 0
    return substitute(l:filename, '^term://.*//[0-9]*:\(.*\)$', '\1', '')
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
  if !exists('*FugitiveHead') || !exists('*GitGutterGetHunkSummary')
    return ''
  endif

  let l:branch = FugitiveHead()
  let l:hunks = GitGutterGetHunkSummary()

  if strlen(l:branch) == 0
    return ''
  elseif l:hunks[0] > 0 || l:hunks[1] > 0 || l:hunks[2] > 0
    return printf("\ue0a0 +%s ~%s -%s",
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

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceSearchTiming = 100
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'

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

nnoremap <silent> <leader>sf :FzfFiles<cr>
nnoremap <silent> <leader>s: :FzfCommands<cr>
nnoremap <silent> <leader>sh :FzfHistory:<cr>
nnoremap <silent> <leader>s? :FzfHelptags<cr>
nnoremap <silent> <leader>sm :FzfMaps<cr>
nnoremap <silent> <leader>sg :FzfBCommits<cr>
nnoremap <silent> <leader>sG :FzfCommits<cr>

" }}}
" vim-gitgutter {{{

let g:gitgutter_map_keys = 0

nmap <leader>hn <plug>(GitGutterNextHunk)
nmap <leader>hp <plug>(GitGutterPrevHunk)
nmap <leader>hs <plug>(GitGutterStageHunk)
nmap <leader>hu <plug>(GitGutterUndoHunk)
nmap <leader>hv <plug>(GitGutterPreviewHunk)

" }}}
" vim-fugitive {{{

nnoremap <silent> <leader>g :Git<cr>

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
let g:ale_fix_on_save = 0

let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'json': ['prettier'],
  \ 'css': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'reason': ['refmt'],
  \ 'rust': ['rustfmt'],
  \ }

nmap J <plug>(ale_detail)
nmap <leader>f <plug>(ale_fix)
nmap <leader>en <plug>(ale_next_wrap)
nmap <leader>ep <plug>(ale_previous_wrap)

" }}}
" ncm2 {{{

autocmd BufEnter * call ncm2#enable_for_buffer()

" }}}
" lsp {{{

let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 0

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
  \ 'reason': ['ocaml-language-server', '--stdio'],
  \ 'ocaml': ['ocaml-language-server', '--stdio'],
  \ 'rust': ['rustup', 'run', 'stable', 'rls'],
  \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> <leader>lr :call LanguageClient_textDocument_rename()<cr>
nnoremap <silent> <leader>ld :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> <leader>lR :call LanguageClient_textDocument_references()<cr>

" }}}
" javascript {{{

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" }}}
