local options = require('core.options')
local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.user_emmet_settings = {
  javascript = {
    extends = 'jsx'
  },
  typescript = {
    extends = 'tsx'
  }
}
g.copilot_filetypes = {
  TelescopePrompt = false,
}

g.EasyMotion_do_mapping = 0
g.EasyMotion_smartcase = 1
g.rust_clip_command = 'pbcopy'
g.python3_host_prog = options.python3_host_prog

opt.complete = ''
opt.background = 'dark'
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

local indent = 4

opt.cursorline = true
vim.cmd [[
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
]]
opt.timeoutlen = 500
opt.mouse = 'a'
opt.encoding = 'utf-8'
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.linebreak = true
opt.showbreak = '+++'
opt.showmatch = true
opt.visualbell = true

opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true

opt.autoindent = true
opt.copyindent = true
opt.shiftwidth = indent
opt.softtabstop = -1
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true

vim.cmd [[
autocmd FileType make setlocal noexpandtab
]]

opt.list = true
opt.listchars = 'tab:»·,trail:·,nbsp:·'

opt.undofile = true
opt.ruler = true
opt.undolevels = 1000
opt.backspace = 'indent,eol,start'
opt.clipboard = 'unnamed'
opt.shell = os.getenv('SHELL') or 'bash'

vim.cmd [[
hi Pmenu ctermfg=white ctermbg=238
]]

vim.cmd [[
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]]

