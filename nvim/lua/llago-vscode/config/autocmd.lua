--  Fix for https://github.com/vscode-neovim/vscode-neovim/issues/1555
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! mode")
  end
})
vim.opt.ut = 50
