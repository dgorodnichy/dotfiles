-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.g.autoformat = false
vim.lsp.set_log_level(vim.log.levels.WARN)

vim.g.root_spec = { "cwd" }

vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"
vim.opt.whichwrap:append("<>[]hl")
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.cursorline = true

vim.keymap.set({ "n", "v", "x" }, "<D-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x" }, "<D-x>", '"+d', { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x", "i", "c" }, "<D-v>", '"+P', { noremap = true, silent = true })
