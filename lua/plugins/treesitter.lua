return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "bash",
        "css",
        "scss",
        "html",
        "java",
        "javadoc",
        "javascript",
        "typescript"
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
