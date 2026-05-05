-- ~/.config/nvim/lua/plugins/jdtls.lua
return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    local is_windows = vim.fn.has("win32") == 1

    if is_windows then
      opts.settings = opts.settings or {}
      opts.settings.java = opts.settings.java or {}
      opts.settings.java.configuration = opts.settings.java.configuration or {}

      opts.settings.java.configuration.runtimes = {
        {
          name = "JavaSE-1.8",
          path = "C:/Program Files/Eclipse Adoptium/jdk-8.0.482.8-hotspot",
        },
        {
          name = "JavaSE-21",
          path = "C:/Program Files/Eclipse Adoptium/jdk-21.0.11.10-hotspot",
          default = true,
        },
      }
    end
  end,
}
