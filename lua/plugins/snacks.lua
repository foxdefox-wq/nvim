return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    opts.picker.sources.grep = opts.picker.sources.grep or {}
    opts.picker.sources.grep.args = {
      "-u",
      "--hidden",
    }

    return opts
  end,
}