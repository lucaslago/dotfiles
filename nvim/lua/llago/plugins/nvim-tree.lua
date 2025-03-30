return { {
  "nvim-tree/nvim-tree.lua",
  cond = not vim.g.vscode, -- Only enable when not in VS Code
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 24 bit colors
    vim.opt.termguicolors = true

    vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
    vim.keymap.set("n", "<leader>r", vim.cmd.NvimTreeRefresh)
    vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFile)

    require("nvim-tree").setup({
      view = {
        width = 100,
        side = "left"
      }
    })
  end
} }
