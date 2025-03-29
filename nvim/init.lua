if vim.g.vscode then
	-- VSCode Neovim specific stuff
	print("nvim-vscode config")
	require("llago-vscode")
else
	require("llago")
end