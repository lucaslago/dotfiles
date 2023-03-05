local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>ag', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

require('telescope').setup {
  defaults = {
    path_display={"truncate"},
    preview = {
      filesize_limit = 1,
      filesize_hook = function(filepath, bufnr, opts)
        local path = require("plenary.path"):new(filepath)
        -- opts exposes winid
        local height = vim.api.nvim_win_get_height(opts.winid)
        local lines = vim.split(path:head(height), "[\r]?\n")
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
      end,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  pickers = {
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
    },
    find_files = {
      theme = 'dropdown'
    },
    git_files = {
      theme = 'dropdown'
    }
  }
}

require('telescope').load_extension('fzf')
