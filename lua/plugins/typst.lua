vim.api.nvim_create_autocmd("FileType", {
  pattern = "typst",
  callback = function()
    require("mini.pairs").map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
  end,
})

return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    version = "1.*",
    opts = {
      invert_colors = "always",
    },
    config = function(_, opts)
      require("typst-preview").setup(opts)
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*.typ",
        callback = function()
          vim.cmd("TypstPreview")
        end,
      })
      vim.api.nvim_create_autocmd("BufUnload", {
        pattern = "*.typ",
        callback = function()
          vim.cmd("TypstPreviewStop")
        end,
      })
    end,
  },
}
