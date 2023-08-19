require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "dockerfile",
      "go",
      "html",
      "java",
      "javascript",
      "json",
      "json5",
      "make",
      "markdown",
      "markdown_inline",
      "ninja",
      "python",
      "rust",
      "toml",
      "typescript",
      "vim",
      "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,  -- `false` will disable the whole extension
  },
}
