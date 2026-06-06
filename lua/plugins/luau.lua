return {
  "lopi-py/luau-lsp.nvim",
  config = function()
    require("luau-lsp").setup({
      platform = { type = "roblox" },
      sourcemap = {
        enabled = false,
        autogenerate = false,
      },
      plugin = { enabled = true, port = 3667 },
      types = { roblox_security_level = "PluginSecurity" },
    })
  end,
}
