return {
  {
    "mason-org/mason.nvim",
    version = "1.11.0",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "1.32.0",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "angularls",
          "cssls"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.cssls.setup({})

      local ts_probe = "/home/raslor/.config/nvm/versions/node/v24.4.1/lib/node_modules"
      local ng_probe = "/home/raslor/.config/nvm/versions/node/v24.4.1/lib/node_modules/@angular/language-server/node_modules"
      local angular_cmd = {"ngserver", "--stdio", "--tsProbeLocations", ts_probe, "--ngProbeLocations", ng_probe}

      lspconfig.angularls.setup({
        cmd = angular_cmd,
        on_new_config = function(new_config)
          new_config.cmd = angular_cmd
        end,
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
