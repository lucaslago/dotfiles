return { {
  "ellisonleao/gruvbox.nvim",
  config = function()
    vim.o.background = "dark" -- or "light" for light mode
    -- Load the colorscheme
    vim.cmd [[colorscheme gruvbox]]
  end
} }
