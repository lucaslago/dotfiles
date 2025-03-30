return {
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,                                          -- Only enable when not in VS Code
    dependencies = {                                                  -- LSP Support
      "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", -- Autocompletion
      "hrsh7th/nvim-cmp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",                          -- Snippets
      "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
    config = function()
      -- Reserve space for diagnostic icons
      vim.opt.signcolumn = 'yes'

      -- Setup Mason to automatically install LSP servers
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'html', 'ts_ls', 'eslint', 'lua_ls', 'rust_analyzer', 'cssls' }
      })

      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always'
        }
      })

      -- Add borders to LSP hover and signature help
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded"
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded"
      })

      -- Setup nvim-cmp
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-y>'] = cmp.mapping.confirm({
            select = true
          })
        }),
        sources = cmp.config.sources({ {
          name = 'nvim_lsp'
        }, {
          name = 'nvim_lsp_signature_help'
        }, {
          name = 'nvim_lua'
        }, {
          name = 'luasnip'
        }, {
          name = 'buffer'
        }, {
          name = 'path'
        } }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        }
      })

      -- Setup capabilities (autocompletion)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Lua LSP specific configuration
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2"
              }
            },
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      -- Setup other LSP servers
      local servers = { 'html', 'ts_ls', 'eslint', 'rust_analyzer', 'cssls' }

      for _, lsp in ipairs(servers) do
        require('lspconfig')[lsp].setup({
          capabilities = capabilities
        })
      end

      -- TODO: Create a version of this for vs-code config and keep it separate for neovim
      -- Create an autocommand group for LSP
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- Global mappings
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = augroup,
        callback = function(ev)
          local opts = {
            buffer = ev.buf
          }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", function()
            require('telescope.builtin').lsp_definitions()
          end, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", function()
            require('telescope.builtin').lsp_implementations()
          end, opts)
          vim.keymap.set("n", "gr", function()
            require('telescope.builtin').lsp_references()
          end, opts)
          vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rr", function()
            require('telescope.builtin').lsp_references()
          end, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end
      })
    end
  },
}
