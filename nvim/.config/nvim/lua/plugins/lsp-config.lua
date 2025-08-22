return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- Make sure this plugin is loaded after nvim-lspconfig
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Or your custom capabilities

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "clangd", "texlab", "ruff", "cssls", "taplo", "biome"},
        handlers = {
          -- The default handler for servers with no custom configuration
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Custom handler for pyright to apply your specific settings
          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                python = {
                  analysis = {
                    ignore = { "*" },
                    autoSearchPaths = true,
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- IMPORTANT: REMOVE ALL lspconfig.<server>.setup() calls from here
      -- The setup is now handled by mason-lspconfig.

      -- Your keymaps and autocommands are safe to keep here
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>do", vim.lsp.buf.document_symbol, {})
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, {})

      -- Any LspAttach autocommands also belong here
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          -- You can add buffer-local keymaps or other attach-time logic here
          -- For example:
          -- local opts = { buffer = event.buf }
          -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end
      })
    end,
  },
}

