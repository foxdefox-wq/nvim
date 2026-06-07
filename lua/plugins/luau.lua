-- luau.lua
-- Lazy vim will merge the returns automatically so other files may edit it
-- This is just the things that you need to change to get luau working (in neovim not including external dependencies)

-- Might need this?
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

-- Needs to be off
return {
  {
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
  },

  -- Needs to be off
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        luau_lsp = { enabled = false },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    opts = {
      endwise = { enable = true },
    },
  },

  -- Support for vif, vaf etc
  {
    "nvim-mini/mini.ai",
    opts = function(_, opts)
      vim.treesitter.query.set(
        "luau",
        "textobjects",
        [[
        ; functions
        (function_definition) @function.outer
        (function_definition body: (block) @function.inner)
        (function_declaration) @function.outer
        (function_declaration body: (block) @function.inner)
        ; calls
        (function_call) @call.outer
        (function_call arguments: (arguments) @call.inner)
        ; conditionals
        (if_statement) @conditional.outer
        (if_statement consequence: (block) @conditional.inner)
        ; loops
        (for_statement) @loop.outer
        (for_statement body: (block) @loop.inner)
        (while_statement) @loop.outer
        (while_statement body: (block) @loop.inner)
        (repeat_statement) @loop.outer
        (repeat_statement body: (block) @loop.inner)
      ]]
      )
      return opts
    end,
  },

  -- The actual luau plugin
  {
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
  },
}
