local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = opts.buffer, desc = opts.desc })
end

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        underline = true,
        virtual_text = { prefix = "●" },
        signs = true,
        update_in_insert = false,
      })

      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      local on_attach = function(client, bufnr)
        local root = util.root_pattern("Gemfile", ".git")(vim.fn.expand("%:p")) or vim.fn.getcwd()
        client.config.cmd_cwd = root
        vim.opt.signcolumn = "yes"

        map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
        map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
        map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
        map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
        map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
        map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
        map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
        map("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous diagnostic" })
        map("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next diagnostic" })
      end

      local ruby_lsp_config = {
        cmd = { vim.fn.trim(vim.fn.system("which ruby-lsp")) },
        filetypes = { "ruby", "eruby" },
        root_markers = { "Gemfile", ".git" },
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          enabledFeatures = {
            codeActions = true,
            diagnostics = true,
            formatting = true,
          },
          formatter = "rubocop",
          linters = { "rubocop" },
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
        settings = {
          rubyLsp = {
            experimentalFeaturesEnabled = true,
          },
        },
      }

      lspconfig.ruby_lsp.setup(ruby_lsp_config)
    end,
  },
}
