return {
  "folke/which-key.nvim",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
