return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      trigger_events = { "BufLeave", "TextChanged" },
      debounce_delay = 3000,
      cleaning_interval = 1000,
    })
  end,
}
