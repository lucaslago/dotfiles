local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'html',
  'ts_ls',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'cssls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})
local cmp_sources = lsp.defaults.cmp_sources()
table.insert(cmp_sources, { name = 'nvim_lsp_signature_help' })

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = cmp_sources
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- vim.api.nvim_create_autocmd("CursorHold", {
  --   buffer = bufnr,
  --   callback = function()
  --     local cursorHoldOpts = {
  --       focusable = false,
  --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  --       border = 'rounded',
  --       source = 'always',
  --       prefix = ' ',
  --       scope = 'cursor',
  --     }
  --     vim.diagnostic.open_float(nil, cursorHoldOpts)
  --   end
  -- })

  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
  vim.keymap.set("n", "gi", require('telescope.builtin').lsp_implementations, opts)
  vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
