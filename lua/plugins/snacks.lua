return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    -- Your existing grep config
    opts.picker.sources.grep = opts.picker.sources.grep or {}
    opts.picker.sources.grep.args = { "-u", "--hidden" }

    -- Add this for Explorer auto-preview
    opts.picker.sources.explorer = {
      layout = {
        preset = "sidebar", -- Keeps the sidebar feel
        preview = "main", -- Forces the preview to show on hover
      },
    }

    return opts
  end,
}
