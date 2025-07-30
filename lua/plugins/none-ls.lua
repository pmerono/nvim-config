return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
      },
    })
    -- para utilizar eslint se debe inicializar eslint en el proyecto angular
    -- con `npm init @eslint/config@latest` y luego en el package.json se debe introducir:
    --  "eslintConfig": {
    --    "extends": "eslint:recommended"
    --  }
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
