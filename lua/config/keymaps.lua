-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { silent = true }

-- Util
map("i", "jk", "<Esc>", {})
map("v", "jk", "<Esc>", {})
map("x", "jk", "<Esc>", {})
map("n", "<leader>w", "<cmd>:w!<cr>", { desc = "Save file" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol " })

-- Telescope
map("n", "<leader>fw", require("telescope.builtin").live_grep, { desc = "Telescope Live grep" })
map("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "Telescope Browse old files" })

-- Clang
map("n", "<leader>s", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
