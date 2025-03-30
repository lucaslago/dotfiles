return { {
  "mfussenegger/nvim-dap",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  config = function()
    -- Empty configuration as the file is empty
  end
} }
