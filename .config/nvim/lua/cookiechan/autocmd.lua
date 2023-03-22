vim.api.nvim_create_autocmd(
    "Filetype",
    { pattern = {"c", "cpp"}, command = "setlocal commentstring=//\\ %s"}
)
