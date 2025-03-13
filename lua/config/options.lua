-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- vim.keymap.set("i", "<c-k>", vim.NIL)
-- vim.api.nvim_set_keymap("i", "<C-k>", "<C-o>k", { noremap = true, silent = true })-

require("telescope").setup({
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "find",
    },
  },
})
