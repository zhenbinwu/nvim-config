-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Dim inactive windows

-- vim.cmd("highlight default DimInactiveWindows guifg=#666666")
--
-- -- When leaving a window, set all highlight groups to a "dimmed" hl_group
-- vim.api.nvim_create_autocmd({ "WinLeave" }, {
--   callback = function()
--     local highlights = {}
--     for hl, _ in pairs(vim.api.nvim_get_hl(0, {})) do
--       table.insert(highlights, hl .. ":DimInactiveWindows")
--     end
--     vim.wo.winhighlight = table.concat(highlights, ",")
--   end,
-- })
--
-- -- When entering a window, restore all highlight groups to original
-- vim.api.nvim_create_autocmd({ "WinEnter" }, {
--   callback = function()
--     vim.wo.winhighlight = ""
--   end,
-- })
--
-- Close on "q"
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "man",
    "checkhealth",
    "neotest-output-panel",
    "neotest-summary",
    "lazy",
  },
  command = [[
          nnoremap <buffer><silent> q :close<CR>
          nnoremap <buffer><silent> <ESC> :close<CR>
          set nobuflisted
      ]],
})

-- -- Restore cursor to file position in previous editing session
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   callback = function(args)
--     local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
--     local line_count = vim.api.nvim_buf_line_count(args.buf)
--     if mark[1] > 0 and mark[1] <= line_count then
--       vim.cmd('normal! g`"zz')
--     end
--   end,
-- })
