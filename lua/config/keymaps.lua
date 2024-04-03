-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Save
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "File Save" })
vim.keymap.set("n", "<leader>fS", "<cmd>wa<cr>", { desc = "File Save All" })

-- Window
vim.keymap.set("n", "<leader>wl", "<c-w>l<cr>", { desc = "Move to Right" })
vim.keymap.set("n", "<leader>wh", "<c-w>h<cr>", { desc = "Move to Right" })
vim.keymap.set("n", "<leader>wj", "<c-w>j<cr>", { desc = "Move to Down" })
vim.keymap.set("n", "<leader>wk", "<c-w>k<cr>", { desc = "Move to Up" })
vim.keymap.del("n", "<leader>w|")
vim.keymap.set("n", "<leader>w/", "<cmd>vsplit<cr>", { desc = "Split Window right", remap = true })
vim.keymap.set("n", "<leader>w-", "<cmd>split<cr>", { desc = "Split Window below", remap = true })
