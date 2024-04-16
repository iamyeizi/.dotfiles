vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.guicursor = ""

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.inccommand = "split"
vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"
-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.cursorline = false

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = false
-- vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
