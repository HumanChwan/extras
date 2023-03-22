local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
	"clangd"
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.configure("sumneko_lua", {
	force_setup = true,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

lsp.configure("clangd", {
    cmd = {
        "clangd",
        "--query-driver=C:\\msys64\\ucrt64\\bin\\g*"
    }
})

lsp.on_attach(function(_, bufnr)
	local options = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
	vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, options)
	vim.keymap.set("n", "gD", function() vim.diagnostic.open_float() end, options)
end)


lsp.setup()
