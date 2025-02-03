require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", stop_after_first = false },
    typescript = { "prettierd", stop_after_first = false },
    typescriptreact = { "prettierd", stop_after_first = false },
    javascriptreact = { "prettierd", stop_after_first = false },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
