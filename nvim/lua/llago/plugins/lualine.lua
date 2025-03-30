return { {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { theme = 'gruvbox_dark' }
} }
