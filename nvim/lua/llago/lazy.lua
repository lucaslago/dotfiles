local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
      lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugin files automatically
require("lazy").setup({
  spec = { -- Load all Lua files in the plugins directory
    {
      import = "llago.plugins"
    } },
  change_detection = {
    -- Automatically check for config file changes and reload
    notify = yes
  },
  install = {
    -- Install missing plugins on startup
    colorscheme = { "gruvbox" }
  },
  ui = {
    -- Add border to Lazy UI
    border = "rounded"
  }
})
