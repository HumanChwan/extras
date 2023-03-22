vim.g.mapleader = " "

vim.keymap.set("n", "<C-s>", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bn<CR>")
vim.keymap.set("n", "<S-Tab>", ":bp<CR>")

-- Scroll with line movement
-- NOTE: Doesn't seem to be working :thinking:
-- vim.keymap.set("n", "zj", "<C-e>j")
-- vim.keymap.set("n", "zk", "<C-e>k")

-- move lines up down
vim.keymap.set({"n", "i"}, "<M-k>", ":m -2<CR>")
vim.keymap.set({"n", "i"}, "<M-j>", ":m +1<CR>")

vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
