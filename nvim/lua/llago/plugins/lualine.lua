return { {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('lualine').setup({
      theme = 'gruvbox_dark',
      sections = {
        lualine_c = { 'filename', require('pomodoro').statusline }
      }
    })
  end
} }
