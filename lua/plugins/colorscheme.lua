return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Load this during startup
    priority = 1000, -- Load this before other plugins
    opts = {
      theme = "wave", -- Options: "wave", "dragon", "lotus"
      background = {
        dark = "wave", -- "wave" is the best for that professional IDE look
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
