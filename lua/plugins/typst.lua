-- typst.lua

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
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.typ",
        callback = function()
          vim.cmd("TypstPreview")
        end,
      })
    end,
  },
}
