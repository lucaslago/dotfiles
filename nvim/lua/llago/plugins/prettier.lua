return { {
  "MunifTanjim/prettier.nvim",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  config = function()
    local prettier = require("prettier")

    -- prettier.setup({
    --   bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
    --   filetypes = {
    --     "css",
    --     "graphql",
    --     "html",
    --     "javascript",
    --     "javascriptreact",
    --     "json",
    --     "less",
    --     "markdown",
    --     "scss",
    --     "typescript",
    --     "typescriptreact",
    --     "yaml",
    --   },
    --   cli_options = {
    --     config_precedence = "prefer-file",
    --   },
    -- })
  end
} }
