return {
  -- Add the ayu theme plugin
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional: Configure ayu here if you want specific options
      -- require('ayu').setup({ overrides = {} })
    end,
  },

  -- Configure LazyVim to load the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-dark",
    },
  },
}
