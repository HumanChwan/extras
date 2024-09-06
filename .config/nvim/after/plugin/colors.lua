function SetDefaultHighlights()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })

    vim.api.nvim_set_hl(0, "LineNr", { ctermfg = "Yellow" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { ctermfg = "Grey" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { ctermfg = "Grey" })
    vim.api.nvim_set_hl(0, "signcolumn", { ctermbg = "none" })
end

function SetColorScheme(color)
	color = color or "gruvbox"

    if (color == "rose-pine") then
        require("rose-pine").setup({
            variant = "main",
            enable = {
                legacy_highlights = true,
                migrations = true,
            },
            disable_background = false,
            disable_float_background = true,
            disable_italics = true,
        })
    end

	vim.cmd.colorscheme(color)

    SetDefaultHighlights()
end

SetColorScheme("rose-pine")
