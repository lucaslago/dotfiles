return { {
  "wthollingsworth/pomodoro.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require('pomodoro').setup({
      -- Default configuration
    })
  end
} }
