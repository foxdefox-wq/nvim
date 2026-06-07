-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.keymap.set("i", "<C-BS>", "<C-o>db", { noremap = true, silent = true })
vim.opt.showbreak = "🡆 "
vim.opt.linebreak = true
vim.opt.breakindent = true
