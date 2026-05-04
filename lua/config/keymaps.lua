-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>gc", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("cd " .. dir)
  print("CWD: " .. dir)
end, { desc = "Change CWD to current buffer" })
