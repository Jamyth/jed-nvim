vim.opt.guicursor = "";

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

local xdg_state_home = os.getenv("XDG_STATE_HOME")
if xdg_state_home == nil then
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
else
    vim.opt.undodir = xdg_state_home .. "/undodir"
end

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 18
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "180"

vim.g.mapleader = " "
