-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
--vim.o.wrap = true
vim.o.textwidth = 80

vim.g.autoformat = true

--vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
--
-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
--vim.g.molten_auto_open_output = false

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
--vim.g.molten_image_provider = "image.nvim"

-- optional, I like wrapping. works for virt text and the output window
--vim.g.molten_wrap_output = true
--
---- Output as virtual text. Allows outputs to always be shown, works with images, but can
---- be buggy with longer images
--vim.g.molten_virt_text_output = true
--
---- this will make it so the output shows up below the \`\`\` cell delimiter
--vim.g.molten_virt_lines_off_by_1 = true

---- quarto
--local runner = require("quarto.runner")
--vim.keymap.set("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
--vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
--vim.keymap.set("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
--vim.keymap.set("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
--vim.keymap.set("v", "<localleader>r", runner.run_range, { desc = "run visual range", silent = true })
--vim.keymap.set("n", "<localleader>RA", function()
--  runner.run_all(true)
--end, { desc = "run all cells of all languages", silent = true })
