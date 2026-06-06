-- Just in case
vim.lsp.config("*", {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
})

-- Settings
vim.lsp.config("luau-lsp", {
  root_markers = { "default.project.json", "selene.toml", "stylua.toml", ".git" },
  settings = {
    ["luau-lsp"] = {
      completion = {
        -- Doesn't work use endwise
        -- autocompleteEnd = true,
        fillCallArguments = true,
      },
      inlayHints = {
        parameterNames = "literals",
        functionReturnTypes = true,
        variableTypes = true,
        parameterTypes = true,
      },
    },
  },
})

return {
  "lopi-py/luau-lsp.nvim",
  opts = {
    platform = { type = "roblox" },
    sourcemap = {
      enabled = true,
      autogenerate = false,
      generator_cmd = { "argon", "sourcemap", "--watch" },
    },
    plugin = { enabled = false },
    types = { roblox_security_level = "PluginSecurity" },
    fflags = {
      enable_new_solver = true,
      sync = true,
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "luau-lsp" then
          vim.fn.jobstart({ "argon", "serve", "--sourcemap" }, { cwd = client.root_dir })
        end
      end,
    })
    require("luau-lsp").setup(opts)
  end,
}
