return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      trigger_events = { "InsertLeave", "TextChanged" }, -- Events that trigger save
      debounce_delay = 1000, -- Delay in ms
    })
  end,
}
