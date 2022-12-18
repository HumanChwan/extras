vim.g.mapleader = " "

vim.keymap.set("n", "<C-s>", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<C-b>", vim.cmd.Ex)

-- Buffer navigation
-- vim.keymap.set("n", "<Tab>", ":bn<CR>")
-- vim.keymap.set("n", "<S-Tab>", ":bp<CR>")

-- vim.keymap.set({ "n", "i" }, "<C-w>", "<Esc>ciw", { remap = false })

-- Scroll with line movement
-- vim.keymap.set("n", "zj", "<C-e>j")
-- vim.keymap.set("n", "zk", "<C-e>k")

