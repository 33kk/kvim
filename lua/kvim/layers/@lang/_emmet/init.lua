local function load(layers)
	if layers.lsp then
		layers.lsp.configs.emmet_ls = {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
		}
	end
end

return {
	load = load,
	load_after = { "lsp" }
}
