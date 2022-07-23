local function load(layers, defs)
	if defs.lsp then
		layers.lsp.configs.emmet_ls = {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
		}
	end
end

return {
	load = load,
	load_after = { "lsp" }
}
