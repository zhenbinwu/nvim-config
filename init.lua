-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.have_nerd_font = true
vim.g.mapleader = ","
vim.g.maplocalleader = ","

--true
require("config.lazy")
vim.cmd("source /Users/benwu/.config/nvim/vimrc.vim")

vim.diagnostic.enable(false)
