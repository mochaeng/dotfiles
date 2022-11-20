local ok, tree = pcall(require, "nvim-tree")
if not ok then return end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup()
