" ╔══════════════════════════════════════════════════════════════╗
" ║               .vimrc  —  Full Developer Config               ║
" ║  Languages: Verilog · AVR ASM · NASM · GCC ASM · C · C++ ·  ║
" ║             Python · Arduino                                  ║
" ║  Features : Syntax · VSCode-style Autocomplete · More        ║
" ╚══════════════════════════════════════════════════════════════╝
"
"  HOW TO EDIT THIS FILE
"  ─────────────────────
"  Every setting has a comment explaining what it does and how to
"  change it.  Search with /SECTION: to jump between sections.
"  After editing, reload without restarting: :source ~/.vimrc
"
"  VIM HOME is set to D:\w64devkit\bin\vim-home
"  This vimrc lives at C:\Users\LENOVO\.vimrc
"  Dictionaries live at D:\w64devkit\bin\vim-home\dict\

" ════════════════════════════════════════════════════════════════
" SECTION: VIM HOME — point Vim at D:\w64devkit\bin\vim-home
" ════════════════════════════════════════════════════════════════

" Override $VIM and $VIMRUNTIME so Vim finds its own files in
" D:\w64devkit\bin\vim-home instead of the default install path.
" These must come before anything that reads $HOME/.vim
let $VIMHOME = 'D:\w64devkit\bin\vim-home'
set runtimepath^=$VIMHOME
set runtimepath+=$VIMHOME\after
" ↑ This adds vim-home at the FRONT of Vim's search path, so your
"   plugins, colors, syntax files, etc. are all found there first.

" ════════════════════════════════════════════════════════════════
" SECTION: BASIC SETTINGS
" ════════════════════════════════════════════════════════════════

" Disable vi compatibility mode — REQUIRED for most modern features
set nocompatible

" Allow loading of filetype-specific plugins and indentation rules
filetype plugin indent on

" Enable syntax highlighting engine
syntax enable

" Set the color theme.
" Popular choices (install with your plugin manager):
"   monokai  gruvbox  dracula  onedark  nord  solarized  tokyonight
" Built-in safe fallbacks: desert  slate  industry  koehler  torte
colorscheme desert
" ↑ Change 'desert' to any scheme listed above

" True-color support (needs a terminal that supports 24-bit color)
" Comment out these two lines if colors look wrong in your terminal
if has('termguicolors')
  set termguicolors
endif

" ════════════════════════════════════════════════════════════════
" SECTION: LINE NUMBERS
" ════════════════════════════════════════════════════════════════

" Show absolute line number on the cursor line
set number

" Show relative line numbers for all OTHER lines.
" This lets you do things like '5dd' to delete 5 lines when you can
" see the distance.  Set 'norelativenumber' to turn off.
set relativenumber

" Width of the line-number column (increase if you have >999 lines)
set numberwidth=4

" ════════════════════════════════════════════════════════════════
" SECTION: INDENTATION & TABS
" ════════════════════════════════════════════════════════════════

" Number of spaces a <Tab> character represents visually
set tabstop=4
" ↑ Change to 2 for web-style indentation

" Number of spaces inserted when you press <Tab> in insert mode
set softtabstop=4

" Number of spaces used for each indent level (>> and <<)
set shiftwidth=4

" Convert tabs to spaces automatically.
" Set 'noexpandtab' to keep real tab characters (e.g. for Makefiles)
set expandtab

" When expanding tabs, round indent to a multiple of shiftwidth
set shiftround

" Copy indent from the previous line when starting a new line
set autoindent

" Smarter indentation for C-style languages (adds extra indent after
" '{', removes it after '}', etc.)
set smartindent

" ════════════════════════════════════════════════════════════════
" SECTION: SEARCH
" ════════════════════════════════════════════════════════════════

" Highlight all search matches in the file
set hlsearch

" Search as you type (incremental search)
set incsearch

" Case-insensitive search by default …
set ignorecase

" … but switch to case-sensitive if the query contains a capital letter
set smartcase

" Press <Esc><Esc> to clear search highlight
nnoremap <Esc><Esc> :nohlsearch<CR>

" ════════════════════════════════════════════════════════════════
" SECTION: DISPLAY & UI
" ════════════════════════════════════════════════════════════════

" Always show the status bar at the bottom (0=never 1=only splits 2=always)
set laststatus=2

" Show cursor position (line, column) in the status bar
set ruler

" Show the command you are typing in the bottom-right corner
set showcmd

" Show matching bracket/parenthesis when cursor is on one
set showmatch

" How long (tenths of a second) to show the matching bracket
set matchtime=2

" Highlight the line the cursor is on
set cursorline

" Highlight the column the cursor is on — useful for alignment.
" Comment out if it's distracting.
" set cursorcolumn

" Minimum number of lines to keep above/below cursor when scrolling
set scrolloff=5

" Minimum number of columns to keep left/right of cursor
set sidescrolloff=8

" Wrap long lines visually (does not insert newlines)
set wrap

" Break wrapped lines at word boundaries instead of mid-word
set linebreak

" Show ↵ at the end of wrapped lines
set showbreak=↪\ 

" Display non-printing characters (tabs, trailing spaces, etc.)
set list
set listchars=tab:→\ ,trail:·,extends:›,precedes:‹,nbsp:·
" ↑ Remove 'tab:→\ ,' if you find tab markers distracting

" ════════════════════════════════════════════════════════════════
" SECTION: COMMAND-LINE & HISTORY
" ════════════════════════════════════════════════════════════════

" Number of commands remembered in history
set history=1000

" Allow tab-completion in the command line
set wildmenu

" Completion mode: complete the longest common string first, then list
set wildmode=longest:full,full

" File patterns to ignore in wildcard expansion
set wildignore=*.o,*.obj,*.a,*.lib,*.so,*.dll,*.exe
set wildignore+=*.d,*.elf,*.hex,*.bin,*.map,*.lst
set wildignore+=*.pyc,*.pyo,__pycache__
set wildignore+=.git,.svn,.hg
set wildignore+=*.swp,*.swo,*~

" ════════════════════════════════════════════════════════════════
" SECTION: BUFFERS & FILES
" ════════════════════════════════════════════════════════════════

" Allow switching away from a modified buffer without saving first
set hidden

" Reload a file automatically when it changes on disk
set autoread

" Encoding for new files
set encoding=utf-8
set fileencoding=utf-8

" Unix line-endings by default (use 'dos' on Windows projects)
set fileformat=unix
set fileformats=unix,dos,mac

" Never create .swp swap files (set 'swapfile' to re-enable)
set noswapfile

" Keep undo history in a file so it survives across sessions.
" The directory must exist; setup.sh creates it automatically.
set undofile
set undodir=$VIMHOME\undo
" ↑ Undo files stored in D:\w64devkit\bin\vim-home\undo\
set undolevels=1000

" ════════════════════════════════════════════════════════════════
" SECTION: DICTIONARY & AUTOCOMPLETE  ←  VSCode-style behaviour
" ════════════════════════════════════════════════════════════════
"
"  HOW AUTOCOMPLETE WORKS (after this config):
"  ────────────────────────────────────────────
"  • While typing, a popup appears automatically after 1 character
"    (just like VSCode IntelliSense) — no key combo needed.
"  • Press Tab   → move DOWN in the list  (like VSCode ↓)
"  • Press S-Tab → move UP   in the list  (like VSCode ↑)
"  • Press Enter → accept the selected item
"  • Press Esc   → close the popup and keep what you typed
"  • Popup stays open as you keep typing — it filters in real time.
"  • The popup disappears only when there are no more matches.
"
"  Sources used (in order):
"    1. Current buffer keywords   (things you already typed)
"    2. Other open buffers
"    3. Dictionary file for the current filetype
"    4. Omni-complete (C syntax, Python etc.) via C-x C-o
"
" ---- Dictionary location ----
" All dict files live in D:\w64devkit\bin\vim-home\dict\
let s:dictdir = 'D:\w64devkit\bin\vim-home\dict'

" ---- Completion sources for C-n / C-p and the auto-popup ----
"   .  = current buffer
"   w  = other windows/buffers in the window list
"   b  = all loaded buffers
"   k  = dictionary files  (loaded per-filetype below)
"   i  = included files (via #include)  — useful in C/C++
"   t  = ctags
set complete=.,w,b,k,i,t

" ---- Popup appearance ----
" menuone  → show menu even for a single match (like VSCode)
" noselect → don't auto-select first item; you pick with Tab/Enter
" noinsert → don't insert text until you confirm (like VSCode)
" popup    → show extra documentation beside the menu (Vim 8.1.1700+)
set completeopt=menuone,noselect,noinsert
" ↑ If you get an error about 'popup' on older Vim, remove it.
"   On Vim 8.1.1700+ you can add ',popup' for extra info windows.

" ---- Minimum key-length before auto-popup fires ----
" 1 means: popup appears after typing just 1 character (VSCode style)
" Increase to 2 or 3 if you find it too aggressive.
set complete+=k

" ════════════════════════════════════════════════════════════════
" SECTION: AUTO-POPUP ENGINE  (VSCode-style, no plugins needed)
" ════════════════════════════════════════════════════════════════
"
"  This replaces the old 'only opens on C-n' behaviour.
"  The function below fires on every character you type in insert
"  mode and opens the completion menu automatically.
"
"  Rules:
"   • Does NOT fire on whitespace, so indentation is unaffected.
"   • Does NOT fire when already inside a comment or string
"     (uses pumvisible() to avoid double-triggering).
"   • Popup disappears naturally when there are zero matches.

function! s:AutoComplete() abort
  " Don't trigger if popup is already visible
  if pumvisible()
    return ''
  endif

  " Don't trigger on whitespace
  let l:col = col('.') - 1
  if l:col == 0
    return ''
  endif

  " Look at the character just typed
  let l:char = getline('.')[l:col - 1]
  if l:char =~# '\s'
    return ''
  endif

  " Trigger keyword completion (same sources as C-n)
  " Using C-x C-p keeps the cursor in place while the menu opens
  return "\<C-x>\<C-n>"
endfunction

" Hook the function to every printable character in insert mode.
" <expr> means the right side is evaluated as an expression, not
" typed literally — the return value is what gets inserted/executed.
"
" NOTE: We use inoremap <expr> on a per-event basis.
"       TextChangedI fires after each character is added/deleted.
augroup AutoCompletePopup
  autocmd!
  " Fire after every insert-mode text change
  autocmd TextChangedI * call s:TriggerComplete()
augroup END

function! s:TriggerComplete() abort
  " Guard: only in insert mode
  if mode() !=# 'i'
    return
  endif
  " Guard: don't double-open
  if pumvisible()
    return
  endif

  let l:col = col('.') - 1
  if l:col == 0
    return
  endif

  let l:char = getline('.')[l:col - 1]
  " Only trigger on word characters (letters, digits, underscore)
  if l:char =~# '\w'
    " Silently call keyword completion
    call feedkeys("\<C-x>\<C-n>", 'n')
  endif
endfunction

" ════════════════════════════════════════════════════════════════
" SECTION: FILETYPE DETECTION & DICTIONARY LOADING
" ════════════════════════════════════════════════════════════════

augroup DictionaryLoad
  autocmd!

  " ---- Verilog / SystemVerilog ----
  autocmd FileType verilog,systemverilog
    \ execute 'setlocal dictionary+=' . s:dictdir . '\verilog.dict'

  " ---- AVR Assembly ----
  "  Files: *.asm  *.s  *.S
  autocmd FileType asm
    \ execute 'setlocal dictionary+=' . s:dictdir . '\avr_asm.dict'

  " ---- NASM Assembly ----
  "  .nasm / .asm files detected as 'nasm' filetype
  autocmd FileType nasm
    \ execute 'setlocal dictionary+=' . s:dictdir . '\nasm.dict'

  " ---- GCC / GNU as assembly ----
  "  Layer both avr + gcc dicts so all mnemonics are available
  autocmd FileType asm
    \ execute 'setlocal dictionary+=' . s:dictdir . '\gcc_asm.dict'

  " ---- C ----
  autocmd FileType c
    \ execute 'setlocal dictionary+=' . s:dictdir . '\c.dict'

  " ---- C++ ----
  autocmd FileType cpp
    \ execute 'setlocal dictionary+=' . s:dictdir . '\c.dict'   |
    \ execute 'setlocal dictionary+=' . s:dictdir . '\cpp.dict'

  " ---- Python ----
  autocmd FileType python
    \ execute 'setlocal dictionary+=' . s:dictdir . '\python.dict'

  " ---- Arduino  (treated as C++ with extra keywords) ----
  "  .ino files → arduino filetype; fall back to cpp if not set
  autocmd FileType arduino
    \ execute 'setlocal dictionary+=' . s:dictdir . '\c.dict'     |
    \ execute 'setlocal dictionary+=' . s:dictdir . '\cpp.dict'   |
    \ execute 'setlocal dictionary+=' . s:dictdir . '\arduino.dict'

augroup END

" ════════════════════════════════════════════════════════════════
" SECTION: FILETYPE-SPECIFIC SETTINGS
" ════════════════════════════════════════════════════════════════

augroup FiletypeSettings
  autocmd!

  " ---- C / C++ ----
  autocmd FileType c,cpp setlocal
    \ tabstop=4 shiftwidth=4 softtabstop=4
    \ expandtab
    \ colorcolumn=80
    " ↑ Vertical ruler at column 80 (change or remove as you like)

  " ---- Verilog / SystemVerilog ----
  autocmd FileType verilog,systemverilog setlocal
    \ tabstop=2 shiftwidth=2 softtabstop=2
    \ expandtab
    \ colorcolumn=100

  " ---- Assembly (AVR / GCC) ----
  autocmd FileType asm setlocal
    \ tabstop=8 shiftwidth=8 softtabstop=8
    \ noexpandtab
    " ↑ Tabs are conventional in assembly

  " ---- NASM ----
  autocmd FileType nasm setlocal
    \ tabstop=4 shiftwidth=4 softtabstop=4
    \ noexpandtab

  " ---- Python ----
  autocmd FileType python setlocal
    \ tabstop=4 shiftwidth=4 softtabstop=4
    \ expandtab
    \ colorcolumn=79
    " ↑ PEP-8 line length limit

  " ---- Arduino ----
  autocmd FileType arduino setlocal
    \ tabstop=2 shiftwidth=2 softtabstop=2
    \ expandtab

  " ---- File-extension → filetype mappings ----
  autocmd BufRead,BufNewFile *.sv,*.svh  setlocal filetype=systemverilog
  autocmd BufRead,BufNewFile *.v,*.vh    setlocal filetype=verilog
  autocmd BufRead,BufNewFile *.asm       setlocal filetype=asm
  autocmd BufRead,BufNewFile *.nasm      setlocal filetype=nasm
  autocmd BufRead,BufNewFile *.ino       setlocal filetype=arduino

augroup END

" ════════════════════════════════════════════════════════════════
" SECTION: KEY MAPPINGS
" ════════════════════════════════════════════════════════════════

" Set the <Leader> key (default \, popular alternative: space or ,)
let mapleader = ","
" ↑ Change to:  let mapleader = " "  for spacebar as leader

" ---- Normal mode shortcuts ----

" Save file quickly
nnoremap <Leader>w :w<CR>

" Save & quit
nnoremap <Leader>q :wq<CR>

" Quit without saving (force)
nnoremap <Leader>Q :q!<CR>

" Toggle relative line numbers on/off
nnoremap <Leader>r :set relativenumber!<CR>

" Toggle display of non-printing chars
nnoremap <Leader>l :set list!<CR>

" ---- Buffer navigation ----
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>d :bdelete<CR>

" ---- Window splitting ----
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>

" Move between windows with Ctrl+hjkl (instead of Ctrl+W then hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ---- Build shortcuts ----
" Run make in the current directory
nnoremap <F5>  :make<CR>
" Run make clean
nnoremap <F6>  :make clean<CR>
" Open quickfix window (shows compiler errors)
nnoremap <F7>  :copen<CR>
" Close quickfix window
nnoremap <F8>  :cclose<CR>
" Go to next error
nnoremap <F9>  :cnext<CR>
" Go to previous error
nnoremap <F10> :cprevious<CR>

" ---- Insert mode ----
" jj to exit insert mode — faster than reaching for Esc
" Comment out if 'jj' appears in your code often
inoremap jj <Esc>

" ---- Autocomplete popup navigation (VSCode style) ----
"
"  Tab     → select NEXT item in popup  (like VSCode ↓)
"  S-Tab   → select PREV item in popup  (like VSCode ↑)
"  Enter   → confirm / accept selection (does not insert newline)
"  Esc     → close popup, keep typed text
"
inoremap <expr> <Tab>
  \ pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>
  \ pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc>
  \ pumvisible() ? "\<C-e>" : "\<Esc>"
" ↑ C-e = cancel popup without inserting; Esc then exits insert mode
"   on the NEXT keypress (one Esc closes popup, second exits insert)
"   If you want one Esc to do both, replace with:
"     inoremap <expr> <Esc> pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"

" ---- Manual completion trigger (if auto-popup is too aggressive) ----
" C-Space → trigger completion manually (like VSCode Ctrl+Space)
inoremap <C-Space> <C-x><C-n>

" ════════════════════════════════════════════════════════════════
" SECTION: SYNTAX HIGHLIGHT TWEAKS
" ════════════════════════════════════════════════════════════════

" Show syntax group name under cursor — useful for theme debugging
" Press <Leader>h to show the highlight group
nnoremap <Leader>h :echo synIDattr(synID(line('.'),col('.'),1),'name')<CR>

" ════════════════════════════════════════════════════════════════
" SECTION: STATUS LINE (no plugin needed)
" ════════════════════════════════════════════════════════════════

" Custom status line showing: buffer, file, flags, filetype, pos
" Remove or replace with a plugin (lightline / lualine / airline)
set statusline=
set statusline+=%n\                           " buffer number
set statusline+=%F\                           " full file path
set statusline+=%m%r%h%w                      " [+] [RO] [help] [preview] flags
set statusline+=%=                            " right-align everything after this
set statusline+=%y\                           " filetype
set statusline+=%-14.(%l,%c%V%)              " line, col
set statusline+=%P                            " percentage through file

" ════════════════════════════════════════════════════════════════
" SECTION: MOUSE
" ════════════════════════════════════════════════════════════════

" Enable mouse support in all modes.
" Change 'a' to 'n' for normal-mode-only, or '' to disable entirely.
if has('mouse')
  set mouse=a
endif

" ════════════════════════════════════════════════════════════════
" SECTION: BACKUP & PERSISTENT UNDO
" ════════════════════════════════════════════════════════════════

" Disable backup files (file~)
set nobackup
set nowritebackup

" ════════════════════════════════════════════════════════════════
" SECTION: OPTIONAL PLUGIN MANAGER BOOTSTRAP (vim-plug)
" ════════════════════════════════════════════════════════════════
"
"  To enable: uncomment the entire block below.
"  Then run vim and type:  :PlugInstall
"
" let s:plug_path = $VIMHOME . '\autoload\plug.vim'
" if empty(glob(s:plug_path))
"   silent execute '!curl -fLo ' . s:plug_path .
"     \ ' --create-dirs https://raw.githubusercontent.com/' .
"     \ 'junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
"
" call plug#begin($VIMHOME . '\plugged')
"
"   " ---- Color schemes ----
"   Plug 'morhetz/gruvbox'
"   Plug 'dracula/vim', { 'as': 'dracula' }
"
"   " ---- Status line ----
"   Plug 'itchyny/lightline.vim'
"
"   " ---- File explorer ----
"   Plug 'preservim/nerdtree'
"   nnoremap <Leader>e :NERDTreeToggle<CR>
"
"   " ---- Fuzzy finder ----
"   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"   Plug 'junegunn/fzf.vim'
"   nnoremap <Leader>f :Files<CR>
"   nnoremap <Leader>b :Buffers<CR>
"
"   " ---- Better syntax (Verilog / SystemVerilog) ----
"   Plug 'vhda/verilog_systemverilog.vim'
"
"   " ---- Better syntax (C/C++) ----
"   Plug 'bfrg/vim-cpp-modern'
"
"   " ---- Async make / linting ----
"   Plug 'dense-analysis/ale'
"   let g:ale_linters = {
"     \ 'c':   ['gcc', 'clang'],
"     \ 'cpp': ['gcc', 'clang++'],
"     \ }
"
"   " ---- Git integration ----
"   Plug 'tpope/vim-fugitive'
"
" call plug#end()
"
" ════════════════════════════════════════════════════════════════
" END OF .vimrc
" ════════════════════════════════════════════════════════════════
