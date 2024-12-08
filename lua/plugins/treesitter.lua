-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "css",
      "dockerfile",
      "go",
      "graphql",
      "html",
      "javascript",
      "json",
      "tsx",
      "typescript",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
