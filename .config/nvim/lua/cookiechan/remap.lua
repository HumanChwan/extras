vim.g.mapleader = " "

vim.keymap.set("n", "<C-s>", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bn<CR>")
vim.keymap.set("n", "<S-Tab>", ":bp<CR>")


-- Scroll with line movement
vim.keymap.set("n", "zj", "<C-e>j")
vim.keymap.set("n", "zk", "<C-e>k")

