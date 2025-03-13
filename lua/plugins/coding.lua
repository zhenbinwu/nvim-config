return {
  --Config blink
  {
    "saghen/blink.cmp",
    ---@class PluginLspOpts
    opts = {
      -- keymap = { preset = "super-tab" },
      keymap = {
        preset = "enter",
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        [";"] = { "accept", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },
        ["'"] = { "hide", "fallback" },
        ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
        ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
      },
      completion = {
        -- trigger = {
        --   show_on_insert_on_trigger_character = false,
        -- },
        --list = { selection = { preselect = false, auto_select = false } },
        menu = { auto_show = true },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      vim.b.completion = true

      Snacks.toggle({
        name = "Completion",
        get = function()
          return vim.b.completion
        end,
        set = function(state)
          vim.b.completion = state
        end,
      }):map("<leader>uk")

      opts.enabled = function()
        return vim.b.completion ~= false
      end
      return opts
    end,
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          --set_python_path =
          --require("lspconfig.configs.pyright").set_python_path( '/opt/homebrew/bin/python3.11' )
          --set_python_path( '/opt/homebrew/bin/python3.11' )()
        },
      },
    },
  },
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- -- disable a keymap
      keys[#keys + 1] = { "<c-k>", false, mode = "i" }
      -- change a keymap
      keys[#keys + 1] = { "<c-k>", "<C-o>k", mode = "i" }
      -- -- disable a keymaps
      keys[#keys + 1] = { "<leader>cc", false, mode = { "n", "v" } }
      -- -- add a keymap
      keys[#keys + 1] = { "<leader>co", false, mode = { "n", "v" } }
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "gp", false, mode = { "n", "x" } },
      { "gP", false, mode = { "n", "x" } },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    keys = { { "<leader>cv", false, mode = "n", ft = "python" } },
    --keys[#keys+1] =
    --opts = function()
    --local keys = require("lazyvim.plugins.extras.lang.python").get()
    ---- -- disable a keymap
    --keys[#keys + 1] = { "<leader>cv", false, mode = "n" }
    --end,
  },

  -- Configure `ruff-lsp`.
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ruff_lsp
  -- For the default config, along with instructions on how to customize the settings
  -- require("lspconfig").ruff_lsp.setup({
  --   init_options = {
  --     settings = {
  --       -- Any extra CLI arguments for `ruff` go here.
  --       args = {},
  --     },
  --   },
  --   on_attach = function(_, client, bufnr)
  --     if client.name == "ruff_lsp" then
  --       -- Disable hover in favor of Pyright
  --       client.server_capabilities.hoverProvider = false
  --     end
  --   end,
  -- }),
  --require("lspconfig").pyright.setup({
  --settings = {
  --pyright = {
  ---- Using Ruff's import organizer
  --disableOrganizeImports = true,
  --},
  --python = {
  --analysis = {
  ---- Ignore all files for analysis to exclusively use Ruff for linting
  --ignore = { "*" },
  --},
  --},
  --},
  --}),

  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    --commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 10,
        max_height = 10,
        default_detail = 1,
      },
    },
  },
  -- leetcode
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- configuration goes here
    },
  },
}
