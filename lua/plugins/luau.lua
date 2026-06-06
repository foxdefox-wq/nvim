return {
  "lopi-py/luau-lsp.nvim",
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "luau-lsp" then
          local root = client.root_dir
          vim.fn.jobstart({ "argon", "serve", "--sourcemap" }, { cwd = root })
        end
      end,
      once = true,
    })
    require("luau-lsp").setup({
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
    })
  end,
}
