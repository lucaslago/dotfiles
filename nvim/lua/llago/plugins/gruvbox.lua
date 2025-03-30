return { {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  config = function()
    vim.o.background = "dark" -- or "light" for light mode
    -- Load the colorscheme
    vim.cmd [[colorscheme gruvbox]]
  end
} }
