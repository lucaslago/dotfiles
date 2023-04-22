require('lualine').setup({
  theme = 'gruvbox',
  sections = {
    lualine_c = { 'filename', require('pomodoro').statusline }
  }
})
