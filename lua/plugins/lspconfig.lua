-- Also needs to be off
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      luau_lsp = { enabled = false },
    },
  },
}
