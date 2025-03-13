-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if package.loaded["smear_cursor"] then
  require("smear_cursor").setup({
    keymaps = {
      ["<leader>ue"] = "SmearCursorToggle",
    },
  })
end

-- Setting for Overseer
vim.api.nvim_create_user_command("OverseerRestartLast", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, {})

--Some vim keymaps
vim.keymap.del("n", "<leader>l") --from LazyVim
vim.keymap.del("n", "<leader>L") --from LazyVim
vim.keymap.del("i", "<leader>") --from LazyVim
vim.keymap.del("n", "<leader>wm") --from LazyVim Zoom mode
vim.keymap.del("n", "<leader>wd") --from LazyVim Delete Window

local wk = require("which-key")
wk.add({
  --{ "<leader>o", group = "overseer", desc = "Overseer", icon = { icon = " " } },
  { "<leader>ot", "<cmd>OverseerToggle<cr>", group = "overseer", desc = "Task Toggle" },
  { "<leader>or", "<cmd>OverseerRestartLast<cr>", desc = "Restart last task", icon = "" },
  {
    "<leader>cv",
    function()
      local diff = vim.t.diffview_view_initialized
      if diff == true then
        vim.cmd("DiffviewClose")
      else
        vim.cmd("DiffviewOpen")
      end
    end,
    desc = "Git DiffView",
    icon = " ",
  },
  {
    "<leader>uv",
    function()
      local virt = vim.diagnostic.config()["virtual_text"]
      if virt == false then
        vim.diagnostic.config({ virtual_text = true })
      else
        vim.diagnostic.config({ virtual_text = false })
      end
    end,
    desc = "Toggle Diagnostic Text",
    icon = "",
  },
  { "<leader>bc", "<cmd>cd %:p:h<cr>", desc = "Change directory of current buffer", icon = " " },
  --{ "==", "<cmd>Toggle<cr>", desc = "Toggle", icon = " " },
})

vim.api.nvim_set_keymap("i", "<C-h>", "<C-o>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<C-o>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<C-o>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<C-o>j", { noremap = true, silent = true })

--vim.api.nvim_set_keymap("i", "<C-h>", "<Esc>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "S", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cc", "gcc", { silent = true })
vim.api.nvim_set_keymap("v", "<leader>cc", "gcc<esc>", { silent = true })

-- Open compiler
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
  "n",
  "<F6>",
  "<cmd>w<cr>"
    .. "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
    .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("i", "<F6>", "<esc><F6>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap(
--   "i",
--   "<F6>",
--   "<esc><cmd>w<cr>"
--     .. "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
--     .. "<cmd>CompilerRedo<cr>",
--   { noremap = true, silent = true }
-- )

-- Toggle compiler results
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Hop Keymap
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set({ "i", "n" }, "<leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { desc = "jump to word forward", remap = true })
vim.keymap.set({ "i", "n" }, "<leader>W", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { desc = "which_key_ignore", remap = true })
vim.keymap.set({ "i", "n" }, "<leader>r", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { desc = "jump to word backward", remap = true })
vim.keymap.set({ "i", "n" }, "<leader>j", function()
  hop.hint_lines({ direction = directions.AFTER_CURSOR })
end, { desc = "which_key_ignore", remap = true })
vim.keymap.set({ "i", "n" }, "<leader>k", function()
  hop.hint_lines({ direction = directions.BEFORE_CURSOR })
end, { desc = "which_key_ignore", remap = true })
vim.keymap.set("", "f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { desc = "which_key_ignore", remap = true })
vim.keymap.set("", "F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { desc = "which_key_ignore", remap = true })

--vim.keymap.set('', 't', function()
--hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
--end, {desc="which_key_ignore", remap=true})
--vim.keymap.set('', 'T', function()
--hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
--end, {desc="which_key_ignore", remap=true})
--2025-01-17
require("nvim-treesitter.configs").setup({
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["gk"] = "@parameter.inner",
      },
      swap_previous = {
        ["gj"] = "@parameter.inner",
      },
    },
  },
})
