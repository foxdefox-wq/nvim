return {
  "nickkadutskyi/jb.nvim",
  lazy = false, -- Load immediately
  priority = 1000, -- Load before all other plugins
  opts = {
    style = "night", -- Set to 'night', 'storm', 'moon', or 'day'
    transparent = false, -- Enable to disable setting the background color
    styles = {
      sidebars = "transparent", -- style for sidebars
      floats = "transparent", -- style for floating windows
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("jb")
  end,
}
