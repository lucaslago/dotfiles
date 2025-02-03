require('lualine').setup({
  theme = 'gruvbox_dark',
  sections = {
    lualine_c = { 'filename', require('pomodoro').statusline }
  }
})
