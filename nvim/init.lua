if vim.g.vscode then
  print("nvim-vscode config")
  require("llago-vscode")
  -- TODO: add vscode specific config
  -- require("llago")
else
  print("nvim config")
  require("llago")
end
