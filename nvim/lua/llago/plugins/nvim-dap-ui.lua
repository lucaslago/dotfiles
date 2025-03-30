return { {
  "rcarriga/nvim-dap-ui",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    require("dapui").setup()
  end
} }
