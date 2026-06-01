return {
  "projekt0n/github-nvim-theme",
  lazy = false, -- Load immediately
  priority = 1000, -- Load before all other plugins
  config = function()
    require("github-theme").setup({})
    vim.cmd.colorscheme("github_dark") -- Options include: github_dark, github_dark_default, github_dark_dimmed
  end,
}
