-- Needs to be off
return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = { "mason-org/mason.nvim", "lopi-py/luau-lsp.nvim" },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_enable = {
        exclude = { "luau_lsp" },
      },
    })
  end,
}
