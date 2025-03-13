return {
  -- List of colorschemes
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/solarized.nvim" },
  { "catppuccin/nvim" },
  { "rebelot/kanagawa.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
