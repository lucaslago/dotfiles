if vim.g.vscode then
  print("nvim-vscode config")
  require('llago')
  require("llago-vscode")
else
  print("nvim config")
  require("llago")
end
