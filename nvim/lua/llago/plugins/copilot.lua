return { {
  "github/copilot.vim",
  config = function()
    -- Configure Copilot
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', {
      silent = true,
      expr = true
    })
  end
} }
