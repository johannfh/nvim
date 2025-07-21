-- NOTE: run `:h key-notation` to see info about <Keys>

-- Set leader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
local diagnostic = require("johannfh.diagnostic")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>dv", function() diagnostic.toggle_diagnostic_display() end,
    { desc = "Toggle [D]iagnostic [V]irtual Display (Virtual Text/Lines/None)" })
