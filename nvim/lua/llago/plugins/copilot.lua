return { {
  "github/copilot.vim",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  config = function()
    -- Configure Copilot
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', {
      silent = true,
      expr = true
    })
  end
} }
