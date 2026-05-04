return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          cwd = true,
        },
        grep = {
          cwd = true,
        },
      },

      -- 🔥 THIS is the important global switch
      follow_cwd = true,
    },
  },
}
