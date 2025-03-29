vim.opt.nu = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "120"
vim.opt.clipboard = 'unnamed'
vim.opt.cmdheight = 2
vim.opt.hidden = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.lazyredraw = true
vim.opt.ruler = true

-- No bells
vim.opt.visualbell = false
vim.opt.errorbells = false

-- Tab
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.showmatch = true
vim.opt.smartcase = true

-- Search
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime = 0

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
