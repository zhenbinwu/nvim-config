return {
  -- Pick nerdy icon
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
  { "will133/vim-dirdiff" },
  {
    "sindrets/diffview.nvim",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      --keys = "etovxqpdygfblzhckisuran",
    },
  },
  {
    "folke/flash.nvim",
    enabled = flase,
  },
  {
    "Dan7h3x/LazyDo",
    branch = "main",
    cmd = { "LazyDoToggle", "LazyDoPin" },
    keys = { -- recommended keymap for easy toggle LazyDo in normal and insert modes (arbitrary)
      {
        "<F2>",
        "<ESC><CMD>LazyDoToggle<CR>",
        mode = { "n", "i" },
      },
    },
    event = "VeryLazy",
    opts = {
      -- your config here
    },
  },
  { "tommcdo/vim-exchange" },
  { "LudoPinelli/comment-box.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["v"] = {
              function(state)
                local node = state.tree:get_node()
                --- Getting the wild match under the path
                if node and node.path then
                  local dir = node.path:match("(.*/)") -- Extract directory
                  local ext = node.path:match("%.([^%.]+)$") -- Extract file extension
                  local wildcard_path = dir .. "*." .. ext
                  local matches = vim.fn.glob(wildcard_path, false, true) -- Get list of files
                  cmd = { "qlmanage", "-p", node.path }
                  for _, v in ipairs(matches) do
                    if v ~= node.path then
                      table.insert(cmd, v) -- Add each string wrapped in double quotes
                    end
                  end
                  vim.fn.jobstart(cmd, {
                    detach = true,
                    on_exit = function(_, exit_code, _)
                      if exit_code ~= 0 then
                        print("Command failed with exit code:", exit_code)
                      end
                    end,
                    on_stderr = function(chanid, data, name)
                      print("stderr, data:" .. vim.inspect(data))
                    end,
                  })
                end
              end,
              desc = "Quick Look (macOS Preview)",
            },
            ["u"] = {
              function(state)
                local node = state.tree:get_node()
                vim.fn.jobstart({ "open", "-R", node.path }, { detach = true })
              end,
              desc = "Open in finder",
            },
          },
        },
      },
    },
  },
}
